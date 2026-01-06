{ config, pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [

    lutris
    wine
    protonplus

    (lutris.override {
      extraLibraries =  pkgs: [
        # List library dependencies here
      ];
    })

    (lutris.override {
       extraPkgs = pkgs: [
         # List package dependencies here
       ];
    })

  ];
}
