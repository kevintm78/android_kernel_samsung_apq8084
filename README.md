# Flashpoint-aosp kernel

An aosp kernel for the Note 4 (Snapdragon). Device codename: trlte



### How to build this kernel

##### Linux-
 
> A virtual machine on windows will work, but I prefer to dual boot Linux or have Linux as the sole OS. There are many Linux distros to pick from and if you're new to it then I recommend something like Ubuntu. Get at least Ubuntu LTS(14.04), but you may as well get the latest version. I'm currently using Xubuntu 16.04, a slim down version of Ubuntu.

##### Packages required for building-

> Open terminal and install the following packages: (copy/paste)

        sudo apt-get install git ccache automake lzop bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 g++-multilib python-networkx libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush schedtool dpkg-dev liblz4-tool make optipng

##### Source Code 

> Clone source by entering the following:


* Flashpoint rev.4
        git clone https://github.com/ModestRepo/Flashpoint-aosp.git rev.4
* Flashpoint rev.4 with extended battery patch
        git clone https://github.com/ModestRepo/Flashpoint-aosp.git rev.4-exbattery
* Stock LineageOS kernel
        git clone https://github.com/ModestRepo/Flashpoint-aosp.git lineage-16

##### Download a Toolchain

> It's recommended by in the stock kernel source to use a GCC 4.8 toolchain. You're welcome to try others but there's a little extra work involved if thats the route you take.

> To use google's prebuilt toolchain clone this:
        git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8

> I prefer UberTC's prebuilt toolchain. If you would like to as well, clone this:
        git clone https://bitbucket.org/UBERTC/arm-eabi-4.8.git

##### Set the Toolchain

* Find the env_setup.sh file and go to line 27. Change that line to match the path to where you have your toolchain downloaded.
>  I just made a toolchain folder in my home directory to keep the different toolchains I've downloaded. If you did the same and are using UberTC's 4.8 toolchain you'll just have to replace my name with yours.

#### Build the Kernel

* To build this kernel, just open a terminal in the root directory of the kernel source an run this command:
        ./bto.sh
> I call it building through osm0sis. His Anykernel project has certainly made things easy and nearly all the scripting that I have learned was from his various tutorials. A lot of credit goes to Halask and UpInTheAir for their kernel building scripts too. Most of the ideas for this script is their work.

Once the build is finished you should have a finished zip in the Anykernel3 folder that is ready to flash.




