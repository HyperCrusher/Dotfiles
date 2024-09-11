{
  user,
  pkgs,
  ...
}:
{
  nix.settings = {
    auto-optimise-store = true;
    warn-dirty = false;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  time.timeZone = user.timezone;

  environment = {
    localBinInPath = true;
    variables = {
      EDITOR = "nvim";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      XCURSOR_SIZE = "24";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      GTK_THEME = "Tokyonight-Dark-BL";
      XCURSOR_THEME = "Qogir Cursors";
    };

    systemPackages = with pkgs; [
      qogir-theme
      qogir-icon-theme
      tokyonight-gtk-theme
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
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = [
      "ntfs"
      "btrfs"
    ];
    loader = {
      timeout = 300;
    };
  };

  console = {
    earlySetup = true;
    keyMap = "us";
    font = "Lat2-Terminus16";
    colors = [
      "16161e"
      "db4b4b"
      "9ece6a"
      "ff9e64"
      "7aa2f7"
      "bb9af7"
      "2ac3de"
      "c0caf5"
      "a9b1d6"
      "db4b4b"
      "9ece6a"
      "ff9e64"
      "7aa2f7"
      "bb9af7"
      "2ac3de"
      "c0caf5"
    ];
  };

}
