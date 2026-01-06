{ config, pkgs, ... }: 

{
  environment = {
    shellAliases = { update = "switch"; };
    systemPackages = with pkgs; [
      (writeScriptBin "switch" ''
        #!${pkgs.bash}/bin/bash
        sudo ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch --refresh --no-write-lock-file --flake git+ssh://git@gitea.nicklis.cloud:2022/Coffeelosopher/nixconfig.git#
      '')
      (writeScriptBin "testconfig" ''
        #!${pkgs.bash}/bin/bash
        sudo shutdown -r 30
        sudo ${pkgs.nixos-rebuild}/bin/nixos-rebuild test --refresh --no-write-lock-file --flake git+ssh://git@gitea.nicklis.cloud:2022/Coffeelosopher/nixconfig.git#
      '')
      (writeScriptBin "boot" ''
        #!${pkgs.bash}/bin/bash
        sudo ${pkgs.nixos-rebuild}/bin/nixos-rebuild boot --refresh --no-write-lock-file --flake git+ssh://git@gitea.nicklis.cloud:2022/Coffeelosopher/nixconfig.git#
      '')
      (writeScriptBin "generate-iso" ''
        #!${pkgs.bash}/bin/bash
        for item in /nix/store/*source; do
          echo "Cleaning $item"
          nix-store --delete $item
        done
        nixos-generate -f iso --flake git+ssh://git@gitea.nicklis.cloud:2022/Coffeelosopher/nixconfig.git#nixos
      '')
      (writeScriptBin "clean" ''
        #!${pkgs.bash}/bin/bash
        tmux \
          new-session 'docker system prune --volumes -af ; bash' \; \
          split-window 'nix-collect-garbage -d ; bash'
      '')
      (writeScriptBin "docker-up-all" ''
        #!${pkgs.bash}/bin/bash
        for directory in */; do
            cd $directory
            echo Processing $directory

            # update file available ?
            if [ -f "./update.sh" ]; then
                echo "Using Update File ./update.sh"
                bash update.sh
            else
                echo "Using generic docker compose down / up for update"
                echo Pulling $PWD
                docker compose pull
                # echo Stopping $PWD
                # docker compose down --remove-orphans
                echo Starting $PWD
                docker compose up -d
            fi
            cd ..
        done
      '')
    ];
  };
}
