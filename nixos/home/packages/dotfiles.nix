{ config, ... }:

let
  dotfiles = builtins.toString ../../../dotfiles;
in
{
  xdg.configFile = {
    "gtk-3.0/colors.css" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/gtk-3.0/colors.css";
    };
    "gtk-3.0/gtk.css" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/gtk-3.0/gtk.css";
    };
    "gtk-3.0/bookmarks" = {
      text = ''
        file:///home/${config.home.username}/Downloads
        file:///home/${config.home.username}/Documents
        file:///home/${config.home.username}/Documents/vaults
        file:///home/${config.home.username}/Repos
      '';
    };
    "gtk-4.0" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/gtk-4.0";
    };
    "qt5ct" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/qt5ct";
    };
    "qt6ct" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gtk/qt6ct";
    };
    "rofi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/rofi";
    };
  };
  home.file = {
    "Pictures/wallpapers" = {
      source = "${dotfiles}/wallpapers";
      force = true;
    };
    "Documents/vaults/personal/.keep" = {
      text = "";
    };
    "Documents/vaults/work/.keep" = {
      text = "";
    };
  };
}
