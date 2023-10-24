#!/bin/bash
BASE=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
cd "$BASE/.." || exit 1

docker run -it -p 2022:22 -d -v "$(pwd)":/data --privileged --name=lede-builder zhenkai.sun/lede-builder
