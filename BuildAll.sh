#!/bin/bash
# Give them a unique id for clarity
UBUNTU_ID="felix86-ubuntu-24.04-$(date +%s%N)"
TINY_ID="felix86-tiny-$(date +%s%N)"

set -e

sudo docker build -t $UBUNTU_ID ./Ubuntu-24.04
sudo docker create --name Ubuntu-24.04 $UBUNTU_ID
sudo docker cp Ubuntu-24.04:/archive.tar.gz ./Ubuntu-24.04.tar.gz
sudo docker rm Ubuntu-24.04

sudo docker build -t $UBUNTU_ID ./Ubuntu-24.04-NoWine
sudo docker create --name Ubuntu-24.04-NoWine $UBUNTU_ID
sudo docker cp Ubuntu-24.04-NoWine:/archive.tar.gz ./Ubuntu-24.04-NoWine.tar.gz
sudo docker rm Ubuntu-24.04-NoWine

sudo docker build -t $UBUNTU_ID ./Tiny
sudo docker create --name Tiny $UBUNTU_ID
sudo docker cp Tiny:/archive.tar.gz ./Tiny.tar.gz
sudo docker rm Tiny
