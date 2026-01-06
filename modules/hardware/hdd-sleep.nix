{ config, pkgs, ... }: 

{
  powerManagement.powerUpCommands = with pkgs; ''
    ${bash}/bin/bash -c '${hdparm}/bin/hdparm -S 9 -B 127 $(${utillinux}/bin/lsblk -dnp -o name,rota |${gnugrep}/bin/grep '1$' |${coreutils}/bin/cut -d' ' -f1 |${coreutils}/bin/cut -d'/' -f3)'
  '';
}

