{
  description = "NixOS flake setup for my personal devices";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak"; # unstable branch. Use github:gmodena/nix-flatpak/?ref=<tag> to pin releases.
  };

  outputs = { 
    nixpkgs, 
    nixos-hardware, 
    nixos-wsl, 
    home-manager, 
    nix-flatpak, 
    ... 
  }:

  {
    nixosConfigurations = {
      
      zenit = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [

            ./hosts/zenit/default.nix
            nix-flatpak.nixosModules.nix-flatpak
          ];
      };
        

      conan = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/conan/default.nix
          #home-manager.nixosModules.home-manager
          #  {
          #    home-manager.useGlobalPkgs = true;
          #    home-manager.useUserPackages = true;
          #    #home-manager.users.${Machine.username}= ./home.nix;
          #    home-manager.users.joe= ./home.nix;

          #    # Optionally, use home-manager.extraSpecialArgs to pass
          #    # arguments to home.nix
          #  }
        ];
      };

      mblu = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/mblu/default.nix
        ];
      };

      eco = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/eco/default.nix
        ];
      };

      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/wsl/default.nix
          nix-flatpak.nixosModules.nix-flatpak

          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "24.11";
            wsl.enable = true;
          }

          #home-manager.nixosModules.home-manager
          #  {
          #    home-manager.useGlobalPkgs = true;
          #    home-manager.useUserPackages = true;
          #    #home-manager.users.${Machine.username}= ./home.nix;
          #    home-manager.users.joe= ./home.nix;

          #    # Optionally, use home-manager.extraSpecialArgs to pass
          #    # arguments to home.nix
          #  }
        ];
      };

      axiom = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/axiom/default.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-t480 # check if path is correct
        ];
      };


      nuc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nuc/default.nix
        ];
      };
    };
  };
}

