#!/bin/sh
nix-env -iA nixos.git
git clone https://git.skdevstudios.cloud/specCon18/nixos-config.git
sudo nix run github:nix-community/disko -- --mode zap_create_mount /modules/disko/luks-lvm.nix --arg disks '[ "/dev/nvme0n1" ]'
nixos-generate-config --no-filesystems --root /mnt
nixos-install --flake ./#creatorforge-framework 
