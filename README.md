# Build
## Manual
```shell
docker run -it -d --restart=always --privileged --name=ubuntu ubuntu:22.04 /bin/bash
docker exec -it ubuntu bash
apt update
apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pyelftools libpython3-dev qemu-utils rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev python3-setuptools

# create non-root user
groupadd wii
useradd -d /home/wii -m -s /bin/bash -g wii wii
su - wii
git clone https://github.com/sunzhenkai/openwrt-custom.git
cd openwrt-custom
make build
```
NOTE: load configuration from `../config/lede-config`, and save to `.config`
## Docker
```shell
# build docker image
make image
# create docker container
make container
# login container
make login
# build
cd /data && make resolve && make build
```

NOTE: output directory is `lede/bin`

# OpenWrt Configuration
- Load 
    - load config, keep default
- Configure
    - Libraries
        - select what you want
- Save
- Exit


# From

https://github.com/coolsnowwolf/lede

# Theme

https://github.com/jerrykuku/luci-theme-argon

# Plugin

