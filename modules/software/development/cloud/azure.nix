{ config, lib, pkgs, modulesPath, ... }: 

{
  environment.systemPackages = with pkgs; [

    azure-cli
    nixos-generators  # Image builder for using NixOS in the cloud!
    qemu-utils
  ];
} 
