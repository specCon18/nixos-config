{ disks ? [ "/dev/nvme0n1" ], ... }: {
  disk = {
    disk-0 = {
      type = "disk";
      device = builtins.elemAt disks 0;
      content = {
        type = "table";
        format = "gpt";
        partitions = [
          {
            type = "partition";
            name = "ESP";
            start = "1MiB";
            end = "100MiB";
            bootable = true;
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [
                "defaults"
              ];
            };
          }
          {
            name = "swap";
            type = "partition";
            start = "101MiB";
            end = "40960MiB";
            part-type = "primary";
            content = {
              type = "swap";
              randomEncryption = true;
            };
          }
          {
            type = "partition";
            name = "luks";
            start = "40960MiB";
            end = "100%";
            content = {
              type = "luks";
              name = "crypted";
              extraOpenArgs = [ "--allow-discards" ];
              keyFile = "/tmp/secret.key";
              content = {
                type = "lvm_pv";
                vg = "pool";
              };
            };
          }
        ];
      };
    };
  };
  lvm_vg = {
    pool = {
      type = "lvm_vg";
      lvs = {
        root = {
          type = "lvm_lv";
          extraArgs = "--label nixroot";
          size = "128G";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
            mountOptions = [
              "defaults"
            ];
          };
        };
        home = {
          type = "lvm_lv";
          extraArgs = "--label nixhome";
          size = "25G";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/home";
          };
        };
        raw = {
          type = "lvm_lv";
          size = "10M";
        };
      };
    };
  };
}
