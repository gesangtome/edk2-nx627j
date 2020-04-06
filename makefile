#
# Created by 弱弱的胖橘猫丷
#

.PHONY: prebuild build cleanall save

environment:
	@echo "set environment"
	@bash common.sh

prebuild: environment
	@echo "start prebuild"
	@make -C ../edk2/BaseTools

build: environment
	@echo "start build"
	@bash build.sh

clean: clean-all
clean-all:
	@echo "start clean workspace"
	@make -C ../edk2/BaseTools clean
	@rm -rf workspace/Build

save:
	@echo "save result"
	@gzip -c < workspace/Build/Pixel3XL/DEBUG_GCC5/FV/PIXEL3XL_UEFI.fd >uefi.img
	@cat boot-dtb.dtb >> uefi.img
