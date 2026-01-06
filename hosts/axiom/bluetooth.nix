{ config, pkgs, ... }:

{
  # Enable Bluetooth hardware
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Use PipeWire for modern audio stack with Bluetooth support
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable Blueman (GUI Bluetooth manager)
  services.blueman.enable = true;

  # Install Bluetooth-related packages
  environment.systemPackages = with pkgs; [
    bluez
    blueman
    pavucontrol # optional: better audio device control
  ];
}

