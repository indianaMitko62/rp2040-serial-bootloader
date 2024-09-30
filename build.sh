#!/bin/bash

set -euo pipefail

cdir="$(dirname "$(readlink -f "${0}")")"
if [[ $# -ge 1 ]]; then
    build_dir="$(readlink -f "${1}")"
else
    build_dir="${cdir}"/build
fi

git submodule update --init

if [[ ! -d "${build_dir}" ]]; then
    mkdir "${build_dir}"
    cd "${build_dir}"
    cmake "${cdir}"
fi

echo "building"
cd "${build_dir}"
make -j8
