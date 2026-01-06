{ config, pkgs, ... }: 

{
  imports = [
    ./alias/default.nix
  ];

  programs.starship.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  fonts.packages = with pkgs; [ 
    nerd-fonts.fira-code
  ];

  programs.zsh = {
    enable = true;
    setOptions = [ 
      "HIST_IGNORE_DUPS" 
      "SHARE_HISTORY" 
      "HIST_FCNTL_LOCK"
    ];

    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "awesomepanda";

      plugins = [
        "git"
        "docker"
        "docker-compose"
        "lxd"
        "zsh-navigation-tools"
        "zsh-interactive-cd"
        "timer"
        "systemadmin" # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemadmin
        "systemd"
      ];
    };
  };
}
