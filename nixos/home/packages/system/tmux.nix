{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    customPaneNavigationAndResize = true;
    historyLimit = 4096;
    keyMode = "vi";
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-strategy-nvim 'session'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '5'
        '';
      }

    ];

    extraConfig = ''
      set -g set-clipboard on

      # My custom split preferences
      bind -n C-v split-window -h
      unbind '"'
      unbind %

      # Ctrl + b : for commands
      bind : command-prompt

      # Satus bar
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
}
