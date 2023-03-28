#!/bin/sh

if [ $# -ne 3 ]; then
    echo \
"Usage: 
    \$1 Disko Partiton Scheme
        - This pulls from existing paritions located in ./modules/disko/ inside the repo
    \$2 Disk to Partition
        - This script can and will destro data, please do be careful 
    \$3 Target system flake
        - These can be found via running nix show.
"
    exit 1
fi

nix-env -iA nixos.git
git clone https://git.skdevstudios.cloud/specCon18/nixos-config.git
sudo nix run github:nix-community/disko -- --mode zap_create_mount /modules/disko/"$1" --arg disks '[ "'"$2"'" ]'
nixos-generate-config --no-filesystems --root /mnt
nixos-install --flake ./#"$3"
