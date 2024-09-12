{ ... }:

let
  dotfiles = builtins.toString ../../../dotfiles;
in
{
  xdg.configFile = {
    "gtk-3.0" = {
      source = "${dotfiles}/gtk/.config/gtk-3.0";
      recursive = true;
      force = true;
    };
    "gtk-4.0" = {
      source = "${dotfiles}/gtk/.config/gtk-4.0";
      recursive = true;
      force = true;
    };
    "qt5ct" = {
      source = "${dotfiles}/gtk/.config/qt5ct";
      recursive = true;
      force = true;
    };
    "qt6ct" = {
      source = "${dotfiles}/gtk/.config/qt6ct";
      recursive = true;
      force = true;
    };
  };
  home.file = {
    "Pictures/wallpapers" = {
      source = "${dotfiles}/wallpapers";
      recursive = true;
      force = true;
    };
  };
}
