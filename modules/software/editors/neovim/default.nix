{ config, pkgs, ... }: 

{
  programs.neovim = {
    enable = true;
    viAlias = false;
    vimAlias = false;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    ripgrep
    gcc
    gnumake
    zig
    luarocks
    #lua
    lua51Packages.lua
    lua-language-server
    lazygit
    xclip
    #nodejs_23
    nixd #language server
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
  ];

}
