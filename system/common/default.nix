{ pkgs, inputs, ... }:
{
  imports = [
    ./fonts.nix
    ./packages.nix
    ./settings.nix
  ];
  system.stateVersion = "23.11";
}
