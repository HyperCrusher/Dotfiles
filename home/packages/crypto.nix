{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitcoin
    monero
  ];
}
