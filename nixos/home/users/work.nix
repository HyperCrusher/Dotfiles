{ inputs, ... }:
{
  imports = [
    # dotfiles
    ../packages/dotfiles.nix
    # WM
    ../packages/wms/picom.nix
    ../packages/wms/bspwm.nix
    # Applications
    ../packages/office.nix
    ../packages/dev/core.nix
    ../packages/media/thumbails.nix
    ../packages/system/tmux.nix
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
