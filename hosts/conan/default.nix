{ config, lib, pkgs, modulesPath, ... }: 

{
  imports = [
    # Host specific
    ./variables.nix
    ./network.nix
    ./hardware.nix

    # User
    ../../user/privileged/default.nix

    # Base
    ../../modules/base/server.nix

    # Software
    ## Packages
    ../../modules/software/packages/system/complete.nix

    ## VPN
    ../../modules/software/vpn/tailscale/default.nix
    #../modules/software/vpn/zerotier/default.nix

    ## Editor 
    ../../modules/software/editors/neovim/default.nix


    # Container
    ../../modules/software/virtualisation/container/docker/default.nix
    ../../modules/software/virtualisation/container/docker/watchtower.nix
    #../../modules/software/virtualisation/container/lxd/default.nix

    # Housekeeping
    ## garbage collection
    ../../modules/houskeeping/gc/default.nix

    ## Aliases 
    ../../modules/software/shell/alias/default.nix

    ## Homestead java
    ../../modules/software/gaming/minecraft-homestead.nix
  ];

  # HostName and Stateversion
  networking.hostName = "conan";
  system.stateVersion = "23.11";

  # bootloader setup
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Keymap + Keyboard variant
  services.xserver.xkb = {
    layout = "uk";
    variant = "";
  };

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKSBSNv+Trea4+rX7bsRB7J9V49RjWXAkpDTqAos72EC conan@RazerBlade"
	  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRamh4k5eDwjYopD889LnxlEJVFsjJuOeTxvbMSZMMK nico.nicklis@icloud.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILM4DAGi3Pn0mhPGqzDa3uoh4vO0/jA48nryrTLPdvsD nico@Zenit"
  ];
}
