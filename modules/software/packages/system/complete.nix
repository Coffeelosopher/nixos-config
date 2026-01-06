{ config, pkgs, ... }: 

{
  imports = [
    ./default.nix
  ];

  environment.systemPackages = with pkgs; [

	  nixos-generators
	  nixos-option
	  glances
	  magic-wormhole
	  links2
	  dfc
	  jdupes # https://github.com/h2oai/jdupes
	  #ventoy #flagged as insecure
	  autossh
	  speedtest-cli
	  aria2
  ];
}
