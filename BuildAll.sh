#!/bin/bash
# Give them a unique id for clarity
ID="ubuntu-24.04-$(date +%s%N)"

set -e

sudo docker build -t $ID ./Ubuntu-24.04
sudo docker create --name Ubuntu-24.04 $ID
sudo docker cp Ubuntu-24.04:/archive.tar.gz ./Ubuntu-24.04.tar.gz
sudo docker rm Ubuntu-24.04