#
# Created by 弱弱的胖橘猫丷
#

.PHONY: prebuild build cleanall save dtc
all: prebuild build save clean

dtc:
	@make -C dtc
	@mv dtc/dtc dtc_binary

environment:
	@echo "set environment"
	@bash common.sh

prebuild: environment
	@echo "start prebuild"
	@make -C ../edk2/BaseTools

build: environment
	@echo "start build"
	@bash build.sh

clean:
	@echo "start clean workspace"
	@make -C ../edk2/BaseTools clean
	@rm -rf workspace/Build

save:
	@echo "save result"
	@gzip -c < workspace/Build/NX627J/DEBUG_GCC5/FV/NX627J_UEFI.fd > uefi.img
	@cat boot-dtb.dtb >> uefi.img
