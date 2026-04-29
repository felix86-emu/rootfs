#!/bin/bash
set -e

dpkg --add-architecture i386
apt-get update
apt-get upgrade -y

apt install -y sudo bsdmainutils file libc6:i386