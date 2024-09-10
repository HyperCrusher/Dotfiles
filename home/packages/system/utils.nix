{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    coursera-dl
    jq
    monolith
    yt-dlp
  ];
}
