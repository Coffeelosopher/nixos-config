{ config, pkgs, ... }: {

  imports = [ ./default.nix ];

  environment.shellAliases = {

    # NIX ( OS ) Configs
    gui = "Hyprland";

    # Backup
    backup-to-r720 =
      "systemctl start restic-backups-hbms-nixos.service & logs restic-backups-hbms-nixos.service";

    # specialisation
    enable-nvidia = "nixos-rebuild switch -c nvidia-enabled --fast";

    # Channels
    nix-channel-set-stable =
      "nix-channel --add https://channels.nixos.org/nixos-23.05 nixos && nix-channel --update";
    nix-channel-set-unstable =
      "nix-channel --add https://channels.nixos.org/nixos-unstable nixos && nix-channel --update";

    # Transmission 
    transmission-info = "transmission-remote -n transmission:transmission -st";

    # Special Commands
    chmod = "chmod -Rc ";
    chown = "chown -Rc ";
    container = "sudo nixos-container";
    cp = "rsync -ah --no-i-r --info=progress2 ";
    mount = "mount -m"; # Make directory to mount

    # Logs Stuff
    logs = "journalctl --no-tail -f -u";

    # Docker
    docker-down = "docker stop $(docker ps -a -q)";
    docker-rm = "docker-remove";
    docker-remove = "docker-down && docker rm $(docker ps -a -q)";
    docker-compose = "docker compose";
    docker-logs = "docker compose up -d && docker compose logs -f";
  };
}

