{ pkgs, ... }:
{

  environment = {
    localBinInPath = true;
    variables = {
      QT_QPA_PLATFORMTHEME = "qt6ct";
      GTK_THEME = "Tokyonight-Dark-BL";
      XCURSOR_THEME = "Qogir Cursors";
    };

    systemPackages = with pkgs; [
      gtk-engine-murrine
      papirus-icon-theme
      libsForQt5.qt5ct
      kdePackages.qt6ct
      kdePackages.breeze-icons
      gnome-themes-extra
      qogir-theme
      qogir-icon-theme
    ];

    etc = {
      "gtk-2.0/gtkrc".text = ''
        gtk-cursor-theme-name="Qogir Cursors"
      '';
      "xdg/gtk-3.0/settings.ini".text = ''
        [Settings]
        gtk-theme-name=Tokyonight-Dark-BL
        gtk-icon-theme-name=Tokyonight
        gtk-font-name=Source Sans Pro 12
        gtk-cursor-theme-name=Qogir Cursors
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle=hintslight
        gtk-xft-rgba=rgb
      '';
    };
  };
  home-manager.users.root =
    { ... }:
    {
      home = {
        homeDirectory = "/root";
        stateVersion = "23.11";
        file = {
          ".config/gtk-3.0".source = ../../../dotfiles/gtk/.config/gtk-3.0;
          ".config/gtk-4.0".source = ../../../dotfiles/gtk/.config/gtk-4.0;
          ".config/qt5ct".source = ../../../dotfiles/gtk/.config/qt5ct;
          ".config/qt6ct".source = ../../../dotfiles/gtk/.config/qt6ct;
        };
      };
    };
}
