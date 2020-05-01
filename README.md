Attempt to create a minimal EDK2 for nubia NX627J

## Build status
ROBOT-CI:[![Build Status](http://flowertome.ticp.io/jenkins/buildStatus/icon?job=edk2-nx627j)](http://flowertome.ticp.io/jenkins/job/edk2-nx627j/)


## Status
2020-05-01: Currently able to enter the EDK2 UEFI SHELL interface.

2020-05-01: Using Fedora server aarch64 test, the result is: the terminal prompts `"Exiting tboot service and install virtual address map..." to stop here.`


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
