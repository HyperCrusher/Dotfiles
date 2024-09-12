{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrains Mono Nerd";
      package = (
        pkgs.nerdfonts.override {
          fonts = [
            "JetBrainsMono"
          ];
        }
      );
      size = 14;
    };
    settings = {
      disable_ligatures = "never";
      cursor_shape = "beam";
      shell_integration = "no-cursor";
      cursor_blink_interval = 500;
      cursor_stop_blinking_after = 0;
      copy_on_select = "yes";
      strip_trailing_spaces = "always";

      scrollback_lines = 10000;
      scrollback_fill_enlarged_window = "no";

      confirm_os_window_close = 0;
      placement_strategy = "center";
      sync_to_monitor = "yes";
      enable_audio_bell = "no";
      visual_bell_duration = 0.0;
      url_style = "straight";

      background_opacity = "0.85";

      # Theme
      foreground = "#A0A8CD";
      background = "#11121D";
      # Black
      color0 = "#06080A ";
      color8 = "#06080A ";
      # Red
      color1 = "#EE6D85 ";
      color9 = "#EE6D85 ";
      # Green
      color2 = " #95C561";
      color10 = "#95C561";
      # Yellow
      color3 = "  #D7A65F";
      color11 = " #D7A65F";
      # Blue
      color4 = " #7199EE";
      color12 = " #7199EE";
      # Magenta
      color5 = " #A485DD";
      color13 = " #A485DD";
      # Cyan
      color6 = " #7dcfff";
      color14 = "#7dcfff";
      # White
      color7 = " #787c99";
      color15 = " #787c99";
      # Cursor
      cursor = "none";

      # Selection highlight
      selection_foreground = "none";
      selection_background = "none";

      # The color for highlighting URLs on mouse-over
      url_color = "#9ece6a";
    };
  };
}
