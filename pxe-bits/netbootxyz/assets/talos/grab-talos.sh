#!/bin/bash
# Download from factory

ID=
VERSION=v1.12.2

curl -o kernel-amd64 https://factory.talos.dev/image/$ID/$VERSION/kernel-amd64
curl -o initramfs-amd64.xz https://factory.talos.dev/image/$ID/$VERSION/initramfs-amd64.xz

