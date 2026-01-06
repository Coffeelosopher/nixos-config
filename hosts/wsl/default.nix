{ config, lib, pkgs, modulesPath, ... }: 

{

  imports = [
    # Host Specific
    ./variables.nix

    # System Base/Type
    ../../modules/base/wsl.nix

    # User
    ../../user/wsl/default.nix 

    ## Software
    ### User Packages
    ../../modules/software/packages/wsl/default.nix
    ../../modules/software/packages/wsl/wsl-flatpak.nix

    ### System Packages
    ../../modules/software/packages/system/complete.nix

    # Editors
    ## Neovim
    ../../modules/software/editors/neovim/default.nix

    # Automation
    ## Garbage collection
    ../../modules/houskeeping/gc/default.nix
  ];

  # temp flatpak setup
  #services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #systemd.services.flatpak-repo = {
  #  wantedBy = [ "multi-user.target" ];
  #  path = [ pkgs.flatpak ];
  #  script = ''
  #    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  #  '';
  #};

  wsl.startMenuLaunchers = true;
  networking.hostName = "wsl";
}


