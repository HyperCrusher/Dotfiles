{ config, ... }:

let
  dotfiles = builtins.toString ../../../dotfiles;
in
{
  xdg.configFile = {
    "gtk-3.0".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/gtk-3.0";
    "gtk-4.0".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/gtk-4.0";
    "qt5ct".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/qt5ct";
    "qt6ct".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/qt6ct";
    "rofi".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/rofi";
  };
  home.file = {
    ".themes".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/themes";
    ".icons".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/icons";
    "Pictures/wallpapers" = {
      source = "${dotfiles}/wallpapers";
      force = true;
    };
  };
}
