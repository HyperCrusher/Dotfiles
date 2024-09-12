{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    alacritty # due to vm not supporting kitty
    coursera-dl
    jq
    monolith
    yt-dlp
  ];
}
