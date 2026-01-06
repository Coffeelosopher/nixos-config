{ config, pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [

	  sudo
	  zsh
	  bash
	  rsync
	  eza # ls and other basic commands
    zip
    unzip
    toybox
	  nano
	  vim
    neovim
	  git
	  gh
    appimage-run
	  parted
	  pciutils
	  dig
	  curl
	  wget
	  zoxide
	  starship
	  htop
	  btop
	  gdu
	  fzf
	  zellij
	  fastfetch
	  tree
	  pstree
	  busybox
	  iperf3
	  lm_sensors
	  jq
	  inetutils
	  duf
	  trash-cli
	  tldr
	  #fd
	  ack
    python3
	  restic
	  powertop
	  netcat-gnu
	  ranger
	  yazi
	  ncdu
	  bat
	  bat-extras.batman  	
    ntfs3g

	  # Other System Stuff
	  multipath-tools
	  cryptsetup
	  btrfs-progs
	  smartmontools
	  sshfs
  ];
}
