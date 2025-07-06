#!/bin/bash
apt-get update
apt-get install --no-install-recommends -y wine64 

# Create a .tar.gz inside the container while excluding the tempfs directories
touch archive.tar.gz
tar  --exclude=archive.tar.gz --exclude=./media --exclude=./mnt --exclude=./root --exclude=./srv --exclude=./boot --exclude=./home --exclude=./run --exclude=./proc --exclude=./sys --exclude=./dev --exclude=./tmp --exclude=./.dockerenv -czf archive.tar.gz .
