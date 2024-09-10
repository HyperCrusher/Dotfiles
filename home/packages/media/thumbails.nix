{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ffmpegthumbnailer
    ffmpegthumbs
  ];
}
