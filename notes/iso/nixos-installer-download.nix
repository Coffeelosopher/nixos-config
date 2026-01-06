{ config, pkgs, lib, ... }: {

  # boot.supportedFilesystems =
  #   lib.mkForce [ "btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs" ];

  imports = [
    # Provide an initial copy of the NixOS channel so that the user
    # doesn't need to run "nix-channel --update" first.
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];

  # Clone nixos-installer
  systemd.services."nixos-installer-download" = {
    script = ''
      #!${pkgs.bash}/bin/bash
      ${pkgs.git}/bin/git clone https://gitea.nicklis.cloud/Coffeelosopher/nixos-installer.git /etc/nixos/nixos-installer --depth 1
      ${pkgs.coreutils}/bin/ln -s /etc/nixos/nixos-installer /root/nixos-installer
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];
  };

  # Install nix-channel
  systemd.services."nixos-channel-add" = {
    script = ''
      #!${pkgs.bash}/bin/bash
      ${pkgs.nix}/bin/nix-channel --add https://nixos.org/channels/nixos-23.05 nixos
      ${pkgs.nix}/bin/nix-channel --update
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];
  };
}
