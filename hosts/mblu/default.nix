{ config, lib, pkgs, modulesPath, Machine, ... }: 

{
  imports = [
    # Host specific
    ./network.nix
    ./proxy.nix
    ./hardware.nix
    ./variables.nix

    # Base
    ../../modules/base/server.nix

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
	  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO9DEqbD9Q7ZoTww27wQU2WrHkd39S3A1h8pkXMB22N6 nico@fedora"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFQpIsD8IHFqmhL3aeqnIYiUlWQOj8juB7ooc1Ylz3ql Nico@Gaming-Rig"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB3n6T3hNhn/LYJ6zc8OWdoVzYJNYC7jPWKhjJzqio6d nixos@nixos"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILM4DAGi3Pn0mhPGqzDa3uoh4vO0/jA48nryrTLPdvsD nico@Zenit"
  ];

  # hostName
  networking.hostName = "${Machine.hostname}";
  system.stateVersion = "23.05";

  # Keymap + Keyboard variant
  services.xserver.xkb = {
      layout = "uk";
      variant = "";
  };

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  nixpkgs.config.allowUnfree = true;
 }
