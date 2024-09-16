{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nitrogen
  ];

  services.sxhkd = {
    enable = true;
    keybindings = {
      # Launch Applications
      "super + Return" = "kitty";
      "super + @space" = "rofi -show drun";
      "Print" = "flameshot gui -c -s";
      # Restart SXHKD
      "super + Escape" = "pkill -USR1 -x sxhkd";
      # Control bspwm
      "super + c" = "bspc node -c";
      "super + alt + {q,r}" = "bspc {quit,wm -r}";
      "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";
      "super + g" = "bspc node -f next.local";
      "super + alt + {Left,Right}" = "bspc node --to-desktop {prev,next}.local";
      "super + t" = "bspc node -t tiled";
      "super + p " = "bspc node -t pseudo_tiled";
      "super + f" = "bspc node -t fullscreen";
      "super + d" = "bspc node -t floating";
      "super + shift + m" = "bspc node -g marked";
      "super + m" = "bspc desktop -l next";
      "super + {h,j,k,l}" = "bspc node -f {west, south, north, east}";
      "super + alt + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
      "super + alt + shift + {h,j,k,l}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";
      "super + ctrl + {h,j,k,l}" = "bspc node -p {west,south,north,east}";
      "super + ctrl + space" = "bspc node -p cancel";
      "super + {Left,Right}" = "bspc desktop -f {prev,next}.local";
      # Media Buttons
      "XF86AudioLowerVolume" = "amixer set Master 5%-";
      "XF86AudioRaiseVolume" = "amixer set Master 5%+";
      "XF86AudioMute" = "amixer set Master toggle";
    };
  };

  xsession = {
    numlock.enable = true;
    windowManager.bspwm = {
      enable = true;
      startupPrograms = [
        "dunst"
        "flameshot"
      ];
      rules = {
        "pavucontrol" = {
          state = "floating";
        };
        "*:*:RuneLite Launcher" = {
          state = "floating";
        };
      };
      extraConfig = ''
        xsetroot -cursor_name left_ptr
        # Make an array of displays
        xoutput=''$(xrandr | grep ' connected' | cut -d' ' -f1)
        readarray -t displays <<< "''$xoutput"
        startIndex=1
        for index in "''${!displays[@]}"
        do
            bspc monitor "''${displays[index]}" -d  "''$startIndex" "''$((startIndex+1))" "''$((startIndex+2))" "''$((startIndex+3))"
            ((startIndex=startIndex+4))
        done


        # Wallpapers
         for index in "''${!displays[@]}"
         do
             nitrogen --set-zoom-fill --random --head=$index $HOME/Pictures/wallpapers
         done
      '';
      settings = {
        border_width = 3;
        window_gap = 10;

        normal_border_color = "#363945";
        active_border_color = "#363945";
        focused_border_color = "#9471C1";

        automatic_scheme = "longest_side";
        split_ratio = 0.52;
        borderless_monocle = true;
        gapless_monocle = true;
        single_monocle = true;
      };
    };
  };
}
