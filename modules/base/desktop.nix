{ lib, ... }: 

{
  imports = [
    ../../modules/software/shell/zsh.nix
    ../../modules/software/packages/user/desktop.nix
  ];


  # Enable networking
  networking.networkmanager.enable = true;

  # SSHD
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      #X11Forwarding = true;
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # CUPS auto discovery experiment
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Experimental Features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Unfree packages
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  # Limit journal size
  services.journald.extraConfig = lib.mkDefault "SystemMaxUse=250M";

  # Default architecture
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

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

  # Zram 
  zramSwap.enable = lib.mkDefault true;

  # minimal Sound setup
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = false;
    };
  };

  # auto optimise store
  #nix.settings.auto-optimise-store = true;
  #nix.extraOptions = ''
  #  min-free = ${toString (100 * 1024 * 1024)}
  #  max-free = ${toString (1024 * 1024 * 1024)}
  #  keep-outputs = false
  #  keep-derivations = false
  #'';

  # Clean tmp after reboot
  #boot.tmp.cleanOnBoot = lib.mkDefault true;

  # Systemd Boot add memtest and netbootxyz
  #boot.loader = {
  #  timeout = lib.mkDefault 1;
  #  systemd-boot = {
  #    netbootxyz.enable = true;
  #    memtest86.enable = true;
  #  };
  #};
}
