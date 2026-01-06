{ config, pkgs, ... }:

{
  imports = [ ];

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.enable = false; # disabled for wayland only setup

  # kde conntect setup
  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [ 
    # Theme packages
    #libsForQt5.qtstyleplugin-kvantum 
    kdePackages.qtstyleplugin-kvantum
    kdePackages.koi                  # plasma theme toggle thingy ... is okay... 

    # dolphin packages
    kdePackages.dolphin                   # dolphin filemanager 
    kdePackages.dolphin-plugins           # dolphin filemanager sugar
    kdePackages.kdegraphics-thumbnailers  # dolphin image thumbnail preview
    kdePackages.kio
    kdePackages.kio-fuse                  # to mount remote filesystems via FUSE
    kdePackages.kio-extras                # extra protocols support (sftp, fish and more)
    kdePackages.kcolorpicker
    kdePackages.kcolorchooser
    kdePackages.discover
    kdePackages.partitionmanager

    # Other
    kdePackages.filelight
    #kdePackages.kolourpaint # trash ms paint
  ];

  # Fonts
  fonts.packages = with pkgs; [ 
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-mono
  ];

  # Enable FLatpacks
  services.flatpak.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  ###### MISC #####
  services.ratbagd.enable = true;# piper mouse utility service

  # make dolphin mount LUks partitions... hopefully
  services.udisks2.enable = true;
  security.polkit.enable = true;

  # i dont like this, didnt prevent crashes of kde shell even tho it was the proposed solution
  boot.extraModprobeConfig = ''
    options nvidia_drm modeset=1
    options nvidia_drm fbdev=1
  '';
}
