#!/usr/bin/env bash

pth="/home/$(whoami)/.wine/drive_c/users/$(whoami)/AppData/Local/Amazon/Kindle"

if ! [ -d "$pth" ]; then
    wget https://s3.amazonaws.com/kindleforpc/60170/KindleForPC-installer-1.31.60170.exe -P "/home/$(whoami)/"

    mkdir -p "$pth"
    cd "$pth"

    7z -y x "/home/$(whoami)/KindleForPC-installer-1.31.60170.exe"
fi

cd "$pth"
wine Kindle.exe
