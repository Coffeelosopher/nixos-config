{ config, pkgs, Machine, ... }: 

{
  imports = [ 
    ./default.nix
    #./flatpak.nix
  ];

  # make appimages run with gearlever
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  users.users.${Machine.username} = {
    packages = with pkgs; [
      #darktable # lightroom alternative
      #drawio # => switched to selfhosted excalidraw
      qemu
      deskflow
      quickemu
      losslesscut-bin # cuts videos
      mousai # shazam for linux
      pinokio # ai tool installer?
      easyeffects
      bluetui
      pulsemixer
      timeshift
      gtk3
      gearlever
      neovide
      koodo-reader # ebook reader
      alacritty
      ghostty
      starship # terminal prompt
      flatpak
      mpv
      gnome-software
      piper # Mouse utility
      firefox
      thunderbird
      vscode
      ffmpeg-full
      discord
      strawberry
      vlc
      spotify-player
      obs-studio
      signal-desktop
      syncthing
      duplicati
      anki
      #parsec-bin # no need atm
      bleachbit
      filezilla # FTP Client
      #libreoffice # onlyoffice is the way
      pdfarranger
      yt-dlp
      mullvad-browser
      libheif # heic image support
      openconnect # anyconnect alternative... bitte?
      upscayl
    ];
  };
}
