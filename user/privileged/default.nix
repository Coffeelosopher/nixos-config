{ config, pkgs, Machine, ... }: 

{
  imports = [
    ../../modules/software/shell/zsh.nix
  ];

  users.users."${Machine.username}"= {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "${Machine.userDescription}";
    extraGroups =
    [ "${Machine.username}" "networkmanager" "network" "wheel" "lxd" "docker" "libvirtd" "syncthing" ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRamh4k5eDwjYopD889LnxlEJVFsjJuOeTxvbMSZMMK nico.nicklis@icloud.com"
    ];
  };
}
