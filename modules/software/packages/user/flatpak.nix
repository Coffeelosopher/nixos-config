{ lib, pkgs, Machine, ... }: 

{
  services.flatpak.enable = true;

  # Add a new remote. Keep the default one (flathub)
  services.flatpak.remotes = lib.mkOptionDefault [{
    name = "flathub-beta";
    location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
  }];

  services.flatpak.update.auto.enable = false;
  services.flatpak.uninstallUnmanaged = false;

  # Add here the flatpaks you want to install
  services.flatpak.packages = [
    "ca.edestcroix.Recordbox"
    "camp.nook.nookdesktop"
    "com.brave.Browser"
    "com.dec05eba.gpu_screen_recorder"
    "com.github.tchx84.Flatseal"
    "com.spotify.Client"
    "com.vixalien.sticky"
    "io.github.jeffshee.Hidamari"
    "io.github.peazip.PeaZip"
    "org.gimp.GIMP"
    "org.gimp.GIMP.HEIC"
    "org.kde.kolourpaint"
    "org.upscayl.Upscayl"
    #"com.helix_editor.Helix"
  ];
}
