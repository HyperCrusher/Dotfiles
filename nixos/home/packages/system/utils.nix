{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    rofi
    coursera-dl
    jq
    monolith
    yt-dlp
  ];
}
