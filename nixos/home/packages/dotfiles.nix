{ config, ... }:

let
  dotfiles = builtins.toString ../../../dotfiles;
in
{
  xdg.configFile = {
    "gtk-3.0" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/gtk-3.0";
      force = true;
    };
    "gtk-4.0" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/gtk-4.0";
      force = true;
    };
    "qt5ct" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/qt5ct";
      force = true;
    };
    "qt6ct" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/qt6ct";
      force = true;
    };
    "rofi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/rofi";
      force = true;
    };
  };
  home.file = {
    ".themes" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/themes";
      force = true;
    };
    ".icons" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/icons";
      force = true;
    };
    "Pictures/wallpapers" = {
      source = "${dotfiles}/wallpapers";
      force = true;
    };
  };
}
