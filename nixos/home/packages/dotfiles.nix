{ ... }:
{
  home.file = {
    ".config/gtk-3.0".source = ../../../dotfiles/gtk/.config/gtk-3.0;
    ".config/gtk-4.0".source = ../../../dotfiles/gtk/.config/gtk-4.0;
    ".config/qt5ct".source = ../../../dotfiles/gtk/.config/qt5ct;
    ".config/qt6ct".source = ../../../dotfiles/gtk/.config/qt6ct;
    # Wallpapers
    "Pictures/wallpapers".source = ../../../dotfiles/wallpapers;
  };
}
