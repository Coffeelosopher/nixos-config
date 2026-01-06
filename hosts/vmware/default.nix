{ pkgs, lib, ... }:
let
  username = "alice";
  hostname = "vmware-guest";
in 

{
  imports = [ 
    ../../modules/software/editors/neovim/default.nix
  ];

  # Normal NixOS options …
  networking.hostName = "${hostname}";
  users.users.alice = { isNormalUser = true; initialPassword = "changeme"; };

  # open-vm-tools, video + input drivers,
  virtualisation.vmware.guest.enable = true;

  boot.loader.grub = {
    efiSupport = true;
    device = "nodev";
  };
}

