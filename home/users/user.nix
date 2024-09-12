{ user, ... }:
{
  # I want everything to be 'opt-in' and so I dont want too many default.nix's
  imports = [
    ../packages/wms/bspwm.nix
    ../packages/crypto.nix
    ../packages/gaming.nix
    ../packages/office.nix
    ../packages/dev/core.nix
    ../packages/dev/gamedev.nix
    ../packages/media/default.nix
    ../packages/social/default.nix
    ../packages/system/default.nix
    ../packages/torrent.nix
  ];

  home = {
    username = "${user.name_lower}";
    homeDirectory = "/home/${user.name_lower}";
    stateVersion = "23.11";
    # Theme
    file = {
      ".config/gtk-3.0".source = ../../dotfiles/gtk/.config/gtk-3.0;
      ".config/gtk-4.0".source = ../../dotfiles/gtk/.config/gtk-4.0;
      ".config/qt5ct".source = ../../dotfiles/gtk/.config/qt5ct;
      ".config/qt6ct".source = ../../dotfiles/gtk/.config/qt6ct;
      # Wallpapers
      "Pictures/Wallpapers".source = ../../dotfiles/wallpapers/Pictures/Wallpapers;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  programs = {
    home-manager.enable = true;
  };
}
