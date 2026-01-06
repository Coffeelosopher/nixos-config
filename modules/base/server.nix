{ config, pkgs, lib, ... }: 

{
  imports = [ 
    ../../modules/software/shell/zsh.nix
    ../../modules/software/packages/system/complete.nix
    ../../modules/software/vpn/tailscale/default.nix
  ];

  # root ssh key
  users.users.root.openssh.authorizedKeys.keys = [
  	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRamh4k5eDwjYopD889LnxlEJVFsjJuOeTxvbMSZMMK nico.nicklis@icloud.com"
  ];

  # Systemd Boot add memtest and netbootxyz
  boot.loader = {
    timeout = lib.mkDefault 1;
    systemd-boot = {
      netbootxyz.enable = true;
      memtest86.enable = true;
    };
  };

  # SSHD
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      X11Forwarding = true;
    };
  };

  # auto optimise store
  nix.settings.auto-optimise-store = true;
  nix.extraOptions = ''
    min-free = ${toString (100 * 1024 * 1024)}
    max-free = ${toString (1024 * 1024 * 1024)}
    keep-outputs = false
    keep-derivations = false
  '';

  # Experimental Features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Limit journal size
  services.journald.extraConfig = lib.mkDefault "SystemMaxUse=250M";

  # Zram 
  zramSwap.enable = lib.mkDefault true;

  # Clean tmp after reboot
  boot.tmp.cleanOnBoot = lib.mkDefault true;

  # Unfree packages
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  # Default architecture
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Set your time zone.
  time.timeZone = lib.mkDefault "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };
}






