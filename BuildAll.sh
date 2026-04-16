#!/bin/bash
set -e

build_and_export() {
    local folder=$1
    local name="${folder,,}"
    local out="${folder}.tar.gz"
    sudo docker build -t "$name" "./$folder"
    sudo docker create --name "$name" "$name"
    sudo docker export "$name" | bsdtar -czf - \
        --exclude=media --exclude=mnt --exclude=root --exclude=srv \
        --exclude=boot --exclude=home --exclude=run --exclude=proc \
        --exclude=sys --exclude=dev --exclude=tmp --exclude=.dockerenv \
        @- > "$out"
    sudo docker rm "$name"
    sudo docker rmi "$name"
}

build_and_export Ubuntu-24.04
build_and_export Ubuntu-24.04-NoWine
build_and_export Tiny