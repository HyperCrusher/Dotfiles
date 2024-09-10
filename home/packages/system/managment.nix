{ pkgs, ... }:
{
  home.packages = with pkgs; [
    coursera-dl
    jq
    monolith
    qbittorrent
    yt-dlp
  ];
}
