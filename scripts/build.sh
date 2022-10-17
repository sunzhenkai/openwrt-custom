#!/bin/bash
git submodule update --init --recursive

# theme
cp -r theme/luci-theme-argon lede/package/lean/

# config
cp config/lede-config lede/.config

# build lede
cd lede || exit 1
./scripts/feeds update -a
./scripts/feeds install -a

# compile
make download -j$(nproc)
make V=s -j$(nproc)
