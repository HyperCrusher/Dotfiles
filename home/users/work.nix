{ ... }:
{
  imports = [
    ../packages/office.nix
    ../packages/dev/core.nix
    ../packages/media/thumbails.nix
    ../packages/system/browsers.nix
    ../packages/system/managment.nix.nix
  ];

  home = {
    username = "work";
    homeDirectory = "/home/work";
    stateVersion = "23.11";
  };

  programs = {
    home-manager.enable = true;
  };
}
