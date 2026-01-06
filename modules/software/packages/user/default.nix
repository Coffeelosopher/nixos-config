{ config, pkgs, Machine,... }: 

{
  imports = [ 
    ../../editors/neovim/default.nix
  ];

  users.users.${Machine.username}= {
    packages = with pkgs; [

      starship # terminal prompt
      bitwarden-cli
      syncthing
      restic
      bleachbit
      yt-dlp
      cmus
      spotify-player
    ];
  };
}
