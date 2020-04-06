Attempt to create a minimal EDK2 for nubia Z20 (NX627J)

## Status

Can partially boot the Fedora 29 aarch64 kernel: there's no initrd, so the kernel panics when mounting root FS.

Since there's no internal storage support yet, use the addlinux branch to embed a Linux kernel in the UEFI firmware.

## Building
Tested on Fedora 31

First, clone EDK2.

```
cd ..
git clone https://github.com/tianocore/edk2.git --recursive
git clone https://github.com/tianocore/edk2-platforms.git
```

You should have all three directories side by side.

Next, install dependencies:

18.04:

```
sudo apt install build-essential uuid-dev iasl git nasm python3-distutils gcc-aarch64-linux-gnu
```
Fedora 31 (Workstation Edition):
```
sudo dnf install uuid-devel acpica-tools git gcc-aarch64-linux-gnu
```

Also see [EDK2 website](https://github.com/tianocore/tianocore.github.io/wiki/Using-EDK-II-with-Native-GCC#Install_required_software_from_apt)

Finally, run `make all`

Then fastboot boot uefi.img.

# Credits

SimpleFbDxe screen driver is from imbushuo's [Lumia950XLPkg](https://github.com/WOA-Project/Lumia950XLPkg).
