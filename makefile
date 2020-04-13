#
# Created by 弱弱的胖橘猫丷
#

.PHONY: prebuild build cleanall save dtc
all: prebuild build save clean

dtc:
	@make -C dtc
	@mv dtc/dtc dtc_binary

environment:
	@echo "Set environment"
	@bash common.sh

prebuild: environment
	@echo "Start prebuild"
	@make -C ../edk2/BaseTools

build: environment
	@echo "Start build"
	@bash build.sh

clean:
	@echo "Start cleaning 'BaseTools'"
	@make -C ../edk2/BaseTools clean
	@echo "Start cleaning 'dtc'"
	@make -C dtc clean
	@rm -rf dtc_binary
	@echo "Start cleaning 'workspace'"
	@rm -rf workspace/Build

save: dtc
	@echo "Making fake kernel image"
	@gzip -c < workspace/Build/NX627J/DEBUG_GCC5/FV/NX627J_UEFI.fd > uefi_image
	@echo "Append DTB into fake kernel image"
	@bash make_dts make_dtbs move_dtbs append_dtb
	@abootimg --create uefi.img -k uefi_image -r ramdisk-null -f android-kernel-image.cfg

