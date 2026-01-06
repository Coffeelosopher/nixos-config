{ config, lib, pkgs, modulesPath, Machine, ... }:

{
  imports = [
    # Host specific 
    ./hardware.nix
    ./variables.nix
    ./sound.nix
    ./network.nix

    # System Base/Type
    ../../modules/base/desktop.nix

    # GPU driver 
    ../../modules/hardware/nvidia-gpu.nix

    # User
    ../../user/privileged/default.nix

    # Software
    ## System Packages
    ../../modules/software/packages/system/complete.nix

    ### User Packages
    ../../modules/software/packages/user/desktop.nix

    ### Flatpak Packages
    ../../modules/software/packages/user/flatpak.nix

    ## Desktop
    ../../modules/software/desktop/kde.nix

    ## Neovim
    ../../modules/software/editors/neovim/default.nix

    ## IOS 
    ../../modules/hardware/ios.nix

    ## Gaming
    ../../modules/software/gaming/default.nix # default.nix imports everything gaming

    ## Game Development
    #../../modules/software/development/game/unity.nix

    ## Virtual Machines
    #../../modules/software/virtualisation/vm/libvirt.nix

    # Housekeeping
    ## garbage collection
    #../../modules/houskeeping/gc/default.nix

    ## VPN
    ../../modules/software/vpn/tailscale/default.nix
    ../../modules/software/vpn/mullvad/default.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "${Machine.hostname}";

  users.users."${Machine.username}".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRamh4k5eDwjYopD889LnxlEJVFsjJuOeTxvbMSZMMK nico.nicklis@icloud.com" 
  ];

  system.stateVersion = "24.11";


  ### Experiments ###
  # Custom Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
  #boot.kernelPackages = pkgs.linuxPackages_6_17;
}


