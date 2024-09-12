{ ... }:

let
  dotfiles = builtins.toString ../../../dotfiles;
in
{
  xdg.configFile = {
    "gtk-3.0" = {
      source = "${dotfiles}/gtk/gtk-3.0";
      recursive = true;
      force = true;
    };
    "gtk-4.0" = {
      source = "${dotfiles}/gtk/gtk-4.0";
      recursive = true;
      force = true;
    };
    "qt5ct" = {
      source = "${dotfiles}/gtk/qt5ct";
      recursive = true;
      force = true;
    };
    "qt6ct" = {
      source = "${dotfiles}/gtk/qt6ct";
      recursive = true;
      force = true;
    };
    "rofi" = {
      source = "${dotfiles}/rofi";
      recursive = true;
      force = true;
    };
  };
  home.file = {
    ".themes" = {
      source = "${dotfiles}/gtk/themes";
      recursive = true;
      force = true;
    };
    ".icons" = {
      source = "${dotfiles}/gtk/icons";
      recursive = true;
      force = true;
    };
    "Pictures/wallpapers" = {
      source = "${dotfiles}/wallpapers";
      recursive = true;
      force = true;
    };
  };
}
