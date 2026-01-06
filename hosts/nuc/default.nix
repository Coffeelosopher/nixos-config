{ config, lib, pkgs, modulesPath, Machine, ... }: 

{
  imports = [
    ./variables.nix
    ./hardware.nix

    # Modules
    ../../modules/base/server.nix
   
    # VPN
    ../../modules/software/vpn/tailscale/default.nix
    
    # Container
    ../../modules/software/virtualisation/container/docker/default.nix
    ../../modules/software/virtualisation/container/docker/watchtower.nix
    

    # Packages
    ../../modules/software/packages/system/complete.nix
    
  ];

  boot.loader.grub = {
    device = "/dev/nvme0n1p1";
  };

  # root ssh key
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRamh4k5eDwjYopD889LnxlEJVFsjJuOeTxvbMSZMMK nico.nicklis@icloud.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIADy6xPj2lAjifdxgYHlHDPg1KPDtI/qGGKil9EXx0r2 micha@DESKTOP-0EH0FPM"
  ];
  
  # hostName
  networking.hostName = "${Machine.hostname}";
  system.stateVersion = "23.05";

  # Keymap + Keyboard variant
  services.xserver.xkb = {
      layout = "uk";
      variant = "";
  };
  nixpkgs.config.allowUnfree = true;
 }
