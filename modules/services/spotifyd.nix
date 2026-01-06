{ config, pkgs, ... }:

{
  # spotifyd (not working yet)
  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        username = "potifydude95";
        password = "${Secrets.spotifyd_Password}"; 
      };
    };
  };
}
