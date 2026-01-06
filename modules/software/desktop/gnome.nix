{ config, pkgs, ... }:

{

  imports = [ ../../software/packages/user/flatpak.nix ];
  # Enable networking
  networking.networkmanager.enable = true;

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

  # Enable flatpacks
  services.flatpak.enable = true;

  # Printer
  # services.printing.enable = true;

  services.gnome = {
    tracker.enable = true;
    sushi.enable = true;
    gnome-user-share.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.arcmenu
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gnome-40-ui-improvements
    gnomeExtensions.gsconnect
    gnomeExtensions.gtk3-theme-switcher
    gnomeExtensions.user-themes
    gnomeExtensions.clipboard-history
    gnomeExtensions.unite
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.vitals
  ];
  # gsconnect extension depends on the kdeconnect daemon
  programs.kdeconnect.enable = true;

  environment.defaultPackages = with pkgs; [
      gnome.gnome-tweaks
      # themes
      whitesur-icon-theme
      colloid-icon-theme
      apple-cursor
      adw-gtk3
    

      # Fonts - some defaults
      noto-fonts
      noto-fonts-emoji
      source-code-pro
      cantarell-fonts

      # Functionality
      xdg-desktop-portal-gnome # read about it

  ];

  # Nerd Fonts
  fonts.packages = with pkgs; [
      nerd-fonts.fira-code
      #nerd-fonts; ;fonts.DroidSansMono
      #nerd-fonts; ;fonts.ComicShannsMono
      #nerd-fonts; ;fonts.IBMPlexMono Terminus
  ];

  # Packages to exclude from GNOME
environment.gnome.excludePackages = (with pkgs; [
      gnome-tour
    ]) ++ (with pkgs.gnome; [
      epiphany # web browser
      geary # email reader
      gnome-characters
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
      gnome-contacts
      gnome-music
      gnome-weather
      gnome-calendar
]);

# Tray icons Config
services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

}
