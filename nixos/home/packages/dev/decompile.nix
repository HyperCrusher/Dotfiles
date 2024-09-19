{ pkgs, ... }:
{
  home.packages = with pkgs; [
    avalonia-ilspy
  ];
}
