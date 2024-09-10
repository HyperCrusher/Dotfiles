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
    tmux = {
      enable = true;

      baseIndex = 1;
      customPaneNavigationAndResize = true;
      historyLimit = 4096;
      keyMode = "vi";
      terminal = "tmux-256color";

      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        resurrect
        {
          plugin = continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '10'
          '';
        }
        {
          plugin = prefix-highlight;
          extraConfig = ''
            set -g @prefix_highlight_show_copy_mode 'on'
            set -g @prefix_highlight_copy_mode_attr 'fg=black,bg=yellow,bold'
          '';
        }
      ];

      extraConfig = ''
        set -g set-clipboard on

        set -g @resurrect-capture-pane-contents 'on'
        set -g @resurrect-strategy-nvim 'session'

        # My custom split preferences
        bind -n C-v split-window -h
        unbind '"'
        unbind %

        # Ctrl + b : for commands
        bind : command-prompt

        # Satus bar
        set -g status-right '#{prefix_highlight} | %a %Y-%m-%d %H:%M'
        set -g status-justify left
        set -g status-bg default
        set -g status-interval 2

        # Quiet operation
        set-option -g visual-activity off
        set-option -g visual-bell off
        set-option -g visual-silence off
        set-window-option -g monitor-activity off
        set-option -g bell-action none

        set -gq allow-passthrough on

        # Additional vim-like keybinds
        is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
            | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

        bind -n 'M-h' if-shell "$is_vim" 'send-keys M-h' 'resize-pane -L 1'
        bind -n 'M-j' if-shell "$is_vim" 'send-keys M-j' 'resize-pane -D 1'
        bind -n 'M-k' if-shell "$is_vim" 'send-keys M-k' 'resize-pane -U 1'
        bind -n 'M-l' if-shell "$is_vim" 'send-keys M-l' 'resize-pane -R 1'
      '';
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
    snapper
    tldr
    tree
    unrar
    unzip
    upower
    wget
  ];
}
