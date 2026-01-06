{ config, pkgs, ... }:

{
  fileSystems."/mnt/chonker" =
    { device = "/dev/disk/by-uuid/7e9f25be-84d6-414f-bff0-72d43d0705b6";
      fsType = "btrfs";
      options = [
        "noatime"
        "nodiratime"
        "discard"
        "auto"
        "nofail"
      ];
  };
}
