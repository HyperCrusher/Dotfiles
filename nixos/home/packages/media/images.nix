{ pkgs, ... }:
{
  home.packages = with pkgs; [
    feh
    krita
    pixelorama
  ];
}
