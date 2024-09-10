{ ... }:
{
  imports = [
    ../packages/wms/bspwm.nix
    ../packages/office.nix
    ../packages/dev/core.nix
    ../packages/media/thumbails.nix
    ../packages/system/browsers.nix
    ../packages/system/utils.nix
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
