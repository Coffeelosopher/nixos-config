{ config, pkgs, Machine, ... }: 

{
  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["${Machine.username}"];
  # Add user to libvirtd group
  users.users.${Machine.username}.extraGroups = [ "libvirtd" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    adwaita-icon-theme
    virtiofsd

  # UEFI Boot script 
    (pkgs.writeShellScriptBin "qemu-system-x86_64-uefi" ''
      qemu-system-x86_64 \
      -bios ${pkgs.OVMF.fd}/FV/OVMF.fd \
      "$@"
    '')
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
      onBoot = "start";
      onShutdown = "shutdown";
      parallelShutdown = 2;
    };
    spiceUSBRedirection.enable = true;
  };

  services.spice-vdagentd.enable = true;
}
