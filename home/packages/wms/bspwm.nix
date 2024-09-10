{ pkgs, lib, ... }:
{
  # Shell, nix, lua, yaml and json tools should always be present
  home.packages = with pkgs; [
    nitrogen
  ];

  services.sxhkd = {
    enable = true;
    extraConfig = ''
      #################################
      #           App Control         #
      #################################

      super + Return
      	kitty

      # program launcher
      super + @space
        rofi -show run

      # Restart sxhkd
      super + Escape
      	pkill -USR1 -x sxhkd

      # Kill application
      super + c
        bspc node -c

      # Screenshot selection copy to clipboard
      Print
        flameshot gui -c -s

      # quit/restart bspwm
      super + alt + {q,r}
      	bspc {quit,wm -r}

      # send the newest marked node to the newest preselected node
      super + y
      	bspc node newest.marked.local -n newest.!automatic.local

      # Switch window in monocule layout
      super + g
      	bspc node -f next.local

      # move window to next/prev desktop
      super + alt + {Left,Right}
        bspc node --to-desktop {prev,next}.local

      #################################
      #          Window State         #
      #################################

      super + t
        bspc node -t tiled

      super + p 
        bspc node -t pseudo_tiled

      super + f
        bspc node -t fullscreen

      super + d
        bspc node -t floating

      super + shift + m
        bspc node -g marked

      # Toggle Monocle
      super + m
      	bspc desktop -l next

      # Control focus
      super + {h,j,k,l}
        bspc node -f {west, south, north, east}

      # Expand in direction
      super + alt + {h,j,k,l}
      	bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

      # Contract from direction
      super + alt + shift + {h,j,k,l}
      	bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

      # preselect the direction
      super + ctrl + {h,j,k,l}
      	bspc node -p {west,south,north,east}

      # cancel the preselection for the focused node
      super + ctrl + space
      	bspc node -p cancel

      #################################
      #         Desktop State         #
      #################################

      # Control desktop focus
      super + {Left,Right}
      	bspc desktop -f {prev,next}.local

      #################################
      #           Media Keys          #
      #################################

      XF86AudioLowerVolume
      	amixer set Master 5%-
      XF86AudioRaiseVolume
      	amixer set Master 5%+
      XF86AudioMute
        amixer set Master toggle
    '';
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
      extraConfigEarly = ''
        export _JAVA_AWT_WM_NONREPARENTING=1
        export XCURSOR_SIZE=24
        export QT_QPA_PLATFORMTHEME=qt6ct
      '';
      extraConfig = ''
        # Make an array of displays
        xoutput=''$(xrandr | grep ' connected' | cut -d' ' -f1)
        readarray -t displays <<< "''$xoutput"
        startIndex=1
        for index in "''${!displays[@]}"
        do
            bspc monitor "''${displays[index]}" -d  "''$startIndex" "''$((startIndex+1))" "''$((startIndex+2))" "''$((startIndex+3))"
            ((startIndex=startIndex+4))
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
