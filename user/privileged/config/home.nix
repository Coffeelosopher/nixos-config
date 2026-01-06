{ config, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];


  home-manager.users.nico = { pkgs, ... }: {
    home.packages = [ pkgs.atool pkgs.httpie ];
    programs.bash.enable = true;

    programs.git = {
      enable = true;
      userName  = "Nico Nicklis";
      userEmail = "nico.nicklis@icloud.com";
    };

    # The state version is required and should stay at the version you originally installed.
    home.stateVersion = "23.05";
  };
}
