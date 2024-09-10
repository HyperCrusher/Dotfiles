{ pkgs, inputs, ... }:
{
  imports = [
    ./packages.nix
    ./settings.nix
  ];
  system.stateVersion = "23.11";
}
