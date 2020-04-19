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
  export UEFIFD=$WORKSPACE/Build/nubiaZ20/DEBUG_GCC5/FV/NUBIAPKG_UEFI.fd
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
  GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p Pixel3XL/Pixel3XL.dsc
}

make_fake_kernel() {
  gzip -c < $UEFIFD > $WORKSPACE/nubiaZ20pkg-arm64.img
}

appenddtb() {
  for DTB in $WORKSPACE/*.dtb; do
    cat $DTB >> $WORKSPACE/nubiaZ20pkg-arm64.img
  done
}

clean() {
  make -C $WORKSPACE clean
}
  Identity && initialization && $1
