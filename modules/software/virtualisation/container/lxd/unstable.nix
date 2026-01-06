{ config, pkgs, inputs, ... }: 

{
  # Disable old module
  disabledModules = [ "virtualisation/lxd.nix" ];

  # Update new module
  imports = [ (inputs.unstable + "/nixos/modules/virtualisation/lxd.nix") ];

  nixpkgs.overlays = [
    # (final: prev: {
    #   inherit (inputs.unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system})
    #     lxd;
    # })
    (final: prev: {
      inherit (inputs.unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system})
        lxd-unwrapped;
    })
    # (final: prev: {
    #   inherit (inputs.unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system})
    #     ui;
    # })
    # (final: prev: {
    #   inherit (inputs.unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system})
    #     lxc;
    # })
    # (final: prev: {
    #   inherit (inputs.unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system})
    #     squashfsTools;
    # })
  ];

  environment.systemPackages = with pkgs; [ squashfsTools ];

  virtualisation.lxd = {
    enable = true;
    recommendedSysctlSettings = true;
    package = pkgs.lxd-unwrapped;
    ui.enable = true;
    # preseed = {
    #   config = {
    #     core.https_address = "[::]:8443";
    #     #core.trust_password = "";
    #   };
    #   networks = [{
    #     name = "lxdbr0";
    #     type = "bridge";
    #     config = {
    #       "ipv4.address" = "10.201.201.1/24";
    #       "ipv4.nat" = "true";
    #     };
    #   }];
    #   profiles = [{
    #     name = "default";
    #     devices = {
    #       eth0 = {
    #         name = "eth0";
    #         network = "lxdbr0";
    #         type = "nic";
    #       };
    #       root = {
    #         path = "/";
    #         pool = "default";
    #         size = "20GiB";
    #         type = "disk";
    #       };
    #     };
    #   }];
    #   storage_pools = [{
    #     name = "default";
    #     driver = "dir";
    #     config = { source = "/var/lib/lxd/storage-pools/default"; };
    #   }];
    # };
  };
}

