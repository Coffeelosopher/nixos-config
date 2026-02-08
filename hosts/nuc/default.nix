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

    # Editor
    ../../modules/software/editors/neovim/default.nix
    
  ];

  boot.loader.grub = {
    device = "/dev/nvme0n1p1";
  };

  # root ssh key
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRamh4k5eDwjYopD889LnxlEJVFsjJuOeTxvbMSZMMK nico.nicklis@icloud.com"
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
