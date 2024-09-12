{ pkgs, ... }:
{
  home.packages = with pkgs; [
    woeusb
    xarchiver
    p7zip
  ];
}
