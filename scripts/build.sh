#!/bin/bash
git submodule update --init --recursive

# theme
cp -r theme/luci-theme-argon lede/package/lean/
#cp -r plugins/luci-app-ssr-plus lede/package/lean/
cp -r plugins/luci-app-openclash lede/package/lean/

# config
cp config/lede-config lede/.config

sed -i "/helloworld/d" "lede/feeds.conf.default"
echo "src-git helloworld https://github.com/fw876/helloworld.git" >> "lede/feeds.conf.default"
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# build lede
cd lede || exit 1
./scripts/feeds update -a
./scripts/feeds install -a
./scripts/feeds update helloworld
./scripts/feeds install -a -f -p helloworld

make menuconfig

# compile
make download -j$(nproc)
make V=s -j$(nproc)
