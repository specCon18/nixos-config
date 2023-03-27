#!/bin/sh

if [ $# -ne 3 ]; then
    echo "Usage: $0 Disko Partiton Scheme, Disk to Partition, Flake Name"
    exit 1
fi

nix-env -iA nixos.git
git clone https://git.skdevstudios.cloud/specCon18/nixos-config.git
sudo nix run github:nix-community/disko -- --mode zap_create_mount /modules/disko/"$1" --arg disks '[ "'"$2"'" ]'
nixos-generate-config --no-filesystems --root /mnt
nixos-install --flake ./#"$3"
