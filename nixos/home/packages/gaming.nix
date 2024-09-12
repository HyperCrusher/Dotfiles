{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vintagestory
    prismlauncher-unwrapped
    wineWow64Packages.full
    wineWow64Packages.fonts
    heroic-unwrapped
    r2modman
  ];
}
