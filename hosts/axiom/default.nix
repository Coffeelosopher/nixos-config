{ config, lib, pkgs, modulesPath, Machine, ... }:

{
  imports = [
    # Host specific 
    ./hardware.nix
    ./variables.nix
    ./bluetooth.nix
    ./network.nix

    # System Base/Type
    ../../modules/base/desktop.nix

    # User
    ../../user/privileged/default.nix

    # Software
    ## System Packages
    ../../modules/software/packages/system/complete.nix

    ### User Packages
    ../../modules/software/packages/user/desktop.nix

    ## Desktop
    ../../modules/software/desktop/kde.nix

    ## Neovim
    ../../modules/software/editors/neovim/default.nix

    ## Development
    ../../modules/software/development/bash.nix
    # Housekeeping
    ## garbage collection
    #../../modules/houskeeping/gc/default.nix

    ## VPN
    ../../modules/software/vpn/tailscale/default.nix
    ../../modules/software/vpn/mullvad/default.nix

    # Minecraft
    ../../modules/software/gaming/minecraft.nix
  ];

  #fileSystems."/home/nico/ssd" =
  #  { device = "/dev/disk/by-uuid/309fb8b8-facd-4d06-8143-7c0a3c3399ee";
  #    fsType = "ext4";
  #};

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "${Machine.hostname}";

  system.stateVersion = "25.05";

  ### Experiments ###
  # Custom Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
}


