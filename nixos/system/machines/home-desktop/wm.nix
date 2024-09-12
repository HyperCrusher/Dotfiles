{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    flameshot
    xclip
    dunst
  ];
  services.xserver = {
    enable = true;
    windowManager = {
      bspwm = {
        enable = true;
        sxhkd.package = pkgs.sxhkd;
      };
    };
  };

  services.displayManager.ly.enable = true;
}
