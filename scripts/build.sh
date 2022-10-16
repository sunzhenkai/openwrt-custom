#!/bin/bash
git submodule update --init --recursive

# config theme
cd lede/package/lean
cp -r theme/luci-theme-argon lede/package/lean

# build lede
cd lede || exit 1
./scripts/feeds update -a
./scripts/feeds install -a
# config
cp config/lede-config lede/.config
# compile
make download -j8
make V=s -j1