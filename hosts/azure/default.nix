{ config, lib, pkgs, modulesPath, ... }: 

{
  imports = [

    # Modules
    ./zsh.nix
    #../../modules/software/virtualisation/container/docker/default.nix

    (modulesPath + "/virtualisation/azure-common.nix")

    # TODO read this for working nix vm
    # https://github.com/NixOS/nixpkgs/blob/nixos-24.11/nixos/maintainers/scripts/azure-new/examples/basic/system.nix

    #./network.nix
    # Misc Coniguration that is needed but out of scope for todays presentation
    ./misc.nix
  ];
  
  # Networking
  ## HostName
  networking.hostName = "Nix-geht-mehr-Cloud";

  ## research cloud context, dunno if useful
  #networking.domain = "";

  # SSH Fernzugriff
  # SSHD Server properties
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      X11Forwarding = true;
    };
  };

  ## SSH key fuer root user autorisieren
  users.users.root.openssh.authorizedKeys.keys = [ 
  	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRamh4k5eDwjYopD889LnxlEJVFsjJuOeTxvbMSZMMK nico.nicklis@icloud.com"
  ];

  # Environment packa
  environment.systemPackages = with pkgs; [
    sudo              # Superuser do!
    busybox           # common unix utilities
    inetutils         # common Networking utilities
    zsh               # Z-Shell 
    bash              # bourne again shell
    nano              # bad text editor
    vim               # good text editor
    git               # Distributed version control system
    gh                # github cli

    yazi              # command line file manager
    fastfetch         # systeminformation tool
    htop              # system resource monitor
    curl              # Command line tool for transferring files with URL syntax
    wget              # Tool for retrieving files using HTTP, HTTPS, and FTP
    zellij            # modern terminal multiplexer
    duf               # disk usage command line tool
    nixos-generators  # Image builder for using NixOS in the cloud!
  ];

  # makes installing unfree software possible, e.g.: discord 
  nixpkgs.config.allowUnfree = true;

  # Limit journal size
  services.journald.extraConfig = lib.mkDefault "SystemMaxUse=250M";

  # Default CPU architecture
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Systemd Boot add memtest and netbootxyz
  boot.loader = {
    timeout = lib.mkDefault 1;
    systemd-boot = {
      netbootxyz.enable = true;
      memtest86.enable = true;
    };
  };

}
