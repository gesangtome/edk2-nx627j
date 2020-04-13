#!/bin/bash

Identity() {
case $MACHINE in
    JENKINS)
        EDK2="edk2-porting_edk2_master"
        EDK2_PLATFORMS="edk2-porting_platforms_master"
    ;;
    *)
        EDK2="edk2"
        EDK2_PLATFORMS="edk2-platforms"
    ;;
esac
}


initialization() {
  export PACKAGES_PATH=$PWD/../$EDK2:$PWD/../$EDK2_PLATFORMS:$PWD
  export WORKSPACE=$PWD/output
  export DTC=$PWD/sources/dtc/dtc
  export HOSTDTC=$WORKSPACE/HOSTDTC
  export UEFIFD=$WORKSPACE/Build/NX627J/DEBUG_GCC5/FV/NX627J_UEFI.fd
  export KERNEL_IMAGES=$WORKSPACE/nubia_Z20-pkg-aarch64.img
  export RAMDISK=$WORKSPACE/../androidboot/ramdisk
  export KERNEL_CONFIG=$WORKSPACE/../androidboot/android.cfg
  export UEFI_IMAGE=$WORKSPACE/../nubia-Z20_edk2-uefiboot.img
  . ../$EDK2/edksetup.sh
}

makedtc() {
  make -C sources/dtc
  ln -sf $DTC $HOSTDTC
}

makedtb() {
  for DTS in *.dts; do
    $HOSTDTC -I dts -O dtb -o $WORKSPACE/$DTS.dtb $DTS
  done
}

make_uefi_image() {
  GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p NX627J/NX627J.dsc
}

make_fake_kernel() {
  gzip -c < $UEFIFD > $KERNEL_IMAGES
}

appenddtb() {
  for DTB in $WORKSPACE/*.dtb; do
    cat $DTB >> $KERNEL_IMAGES
  done
}

androidboot() {
  $(which "abootimg") --create $UEFI_IMAGE -k $KERNEL_IMAGES -r $RAMDISK -f $KERNEL_CONFIG
}

clean() {
  make -C $WORKSPACE clean
}
  Identity && initialization && $1
