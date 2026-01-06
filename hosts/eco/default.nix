{ config, lib, pkgs, modulesPath, Machine, ... }: 

{
  imports = [
    # Host specific
    ./variables.nix
    ./network.nix
    ./proxy.nix
    ./hardware.nix

    # Base
    ../../modules/base/server.nix

    # User
    ../../user/privileged/default.nix

    # Software
    ## virtualisation
    ../../modules/software/virtualisation/container/docker/default.nix
    ../../modules/software/virtualisation/container/docker/watchtower.nix

    ## system packages
    ../../modules/software/packages/system/complete.nix

    ## Editor
    ../../modules/software/editors/neovim/default.nix
  ];

  services.openssh.enable = true;

  users.users.root.openssh.authorizedKeys.keys = [ 
	  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRamh4k5eDwjYopD889LnxlEJVFsjJuOeTxvbMSZMMK nico.nicklis@icloud.com"
	  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKSBSNv+Trea4+rX7bsRB7J9V49RjWXAkpDTqAos72EC conan@RazerBlade"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFQpIsD8IHFqmhL3aeqnIYiUlWQOj8juB7ooc1Ylz3ql Nico@Gaming-Rig"
  ];

  # hostName
  networking.hostName = "${Machine.hostname}";
  system.stateVersion = "25.05";

  # Keymap + Keyboard variant
  services.xserver.xkb = {
      layout = "uk";
      variant = "";
  };

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  nixpkgs.config.allowUnfree = true;
 }
