{ inputs, ... }:
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
    # Theme
    file = {
      ".config/gtk-3.0".source = "${inputs.dotfiles}/gtk/.config/gtk-3.0";
      ".config/gtk-4.0".source = "${inputs.dotfiles}/gtk/.config/gtk-4.0";
      ".config/qt5ct".source = "${inputs.dotfiles}/gtk/.config/qt5ct";
      ".config/qt6ct".source = "${inputs.dotfiles}/gtk/.config/qt6ct";
      # Wallpapers
      "Pictures/Wallpapers".source = "${inputs.dotfiles}/wallpapers/Pictures/Wallpapers";
    };
  };

  programs = {
    home-manager.enable = true;
  };
}
