{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    rofi
    alacritty # due to vm not supporting kitty
    coursera-dl
    jq
    monolith
    yt-dlp
  ];
}
