
{ pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [
    shellcheck
    exiftool
    bc
    graphviz
    gnuplot
    imagemagick
  ];
}
