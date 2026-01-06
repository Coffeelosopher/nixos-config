{ config, lib, pkgs, modulesPath, ... }: 

{
  # Misc Options we won't look at further
  # initial Nix-Channel version of source iso, do not change in the future
  system.stateVersion = "24.11";

  # Default architecture
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Clean tmp files after reboot
  boot.tmp.cleanOnBoot = lib.mkDefault true;

  # Experimental Features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Select internationalisation properties.
  ## Keyboard settings
  services.xserver.xkb = {
      layout = "uk";
      Variant = "";
  };

  ## settings Locale
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

  # Set your time zone.
  time.timeZone = lib.mkDefault "Europe/Berlin";

  # auto optimise store
  nix.settings.auto-optimise-store = true;
  nix.extraOptions = ''
    min-free = ${toString (100 * 1024 * 1024)}
    max-free = ${toString (1024 * 1024 * 1024)}
    keep-outputs = false
    keep-derivations = false
  '';

  nix.gc = {
    automatic = true;
    dates = "05:30";
    options = "--delete-older-than 7d";
    persistent = true;
    randomizedDelaySec = "30min";
  };
}
