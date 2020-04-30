Attempt to create a minimal EDK2 for nubia NX627J

## Build status
[![Build Status](http://flowertome.ticp.io/jenkins/job/edk2-porting/job/edk2-nx627j/job/master/badge/icon)](http://flowertome.ticp.io/jenkins/job/edk2-porting/job/edk2-nx627j/job/master/)


## Status
Currently able to enter the EDK2 UEFI SHELL interface.


## Building
Tested on `Fedora Workstation`

First, clone EDK2.

```
cd ..
git clone https://github.com/edk2-porting/edk2.git --recursive
git clone https://github.com/edk2-porting/edk2-platforms.git
```

You should have all three directories side by side.

Next, install dependencies:

Fedora:

```
sudo dnf install  libuuid-devel iasl git nasm gcc-aarch64-linux-gnu abootimg
```

Also see [EDK2 website](https://github.com/tianocore/tianocore.github.io/wiki/Using-EDK-II-with-Native-GCC#Install_required_software_from_apt)

Finally, ./build.sh.

Then fastboot flash boot `${UEFI IMAGE NAME}`. `(Please backup the boot partition first)`


## Credits
SimpleFbDxe screen driver is from imbushuo's [Lumia950XLPkg](https://github.com/WOA-Project/Lumia950XLPkg).

Referenced some code and commits from fxsheep's [XiaomiMI6Pkg](https://github.com/fxsheep/edk2-sagit).

Referenced some code and commits from NekokeCore's [XiaomiMI8Pkg](https://github.com/NekokeCore/edk2-dipper).
