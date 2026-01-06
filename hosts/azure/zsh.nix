{ config, pkgs, ... }: 

{
  # optional: import additional nix config files like this
  imports = [ ];

  # install Z-Shell
  environment.shells = with pkgs; [ zsh ];
  
  # make Z-Shell the default shell
  users.defaultUserShell = pkgs.zsh;

  # install some cool fonts
  fonts.packages = with pkgs; [ 
    nerd-fonts.fire-code
  ];

  # Z-shell preferences
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    # settings for ohMyZsh framework 
    ohMyZsh = {
      enable = true;
      theme = "awesomepanda";

      plugins = [
        "git"
        "docker"
        "docker-compose"
        "zsh-navigation-tools"
        "zsh-interactive-cd"
        "systemd"
      ];
    };

    # Z-shell history file handling behavior
    setOptions = [ "HIST_IGNORE_DUPS" "SHARE_HISTORY" "HIST_FCNTL_LOCK" ];
  };

  # optional custom prompt that i like
  environment.systemPackages = with pkgs; [
    starship
  ];

  # enabling the prompt
  programs.starship.enable = true;
}
