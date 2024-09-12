{
  pkgs,
  ...
}:
{
  programs = {
    fzf = {
      fuzzyCompletion = true;
    };
    git = {
      enable = true;

    };
    java = {
      enable = true;
      binfmt = true;
    };
    nm-applet = {
      enable = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman
        thunar-archive-plugin
        thunar-media-tags-plugin
      ];
    };
    udevil.enable = true;
    zsh.enable = true;
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    bat
    bottom
    btrfs-progs
    btrfs-snap
    btrfs-assistant
    curl
    eza
    fd
    fzf
    lemmeknow
    lxqt.lxqt-policykit
    man
    man-pages
    neovim
    ntfs3g
    nfs-utils
    pavucontrol
    pfetch
    power-profiles-daemon
    qt5ct
    qt6ct
    ripgrep
    rsync
    smartmontools
    tldr
    tree
    unrar
    unzip
    upower
    wget
  ];
}
