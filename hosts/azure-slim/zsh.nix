{ config, pkgs, ... }: 

{
  imports = [ ];

  # install Z-Shell
  environment.shells = with pkgs; [ zsh ];
  
  # make Z-Shell the default shell
  users.defaultUserShell = pkgs.zsh;

  # install some cool fonts
  fonts.packages = with pkgs; [ 
    nerd-fonts.fira-code
  ];

  # Z-shell preferences
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    # Z-shell history file handling behavior
    setOptions = [ "HIST_IGNORE_DUPS" "SHARE_HISTORY" "HIST_FCNTL_LOCK" ];
  };
}
