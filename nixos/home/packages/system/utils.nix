{ pkgs, ... }:
{
  home.packages = with pkgs; [
    yazi
    kitty
    rofi
    coursera-dl
    jq
    monolith
    yt-dlp
  ];
}
