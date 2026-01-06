{ config, pkgs, ... }: 

{
  system.autoUpgrade = {
    enable = true;
    persistent = true;
    dates = "04:40"; # Is Default
    randomizedDelaySec = "20m";
    flake =
      "git+ssh://git@gitea.nicklis.cloud:2022/coffeelosopher/nixconfig.git";
    flags = [ "--refresh" "--no-write-lock-file" ];
  };
}
