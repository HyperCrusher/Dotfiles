{ pkgs, inputs, ... }:
{
  home.packages = [
    pkgs.vivaldi
    pkgs.vivaldi-ffmpeg-codecs
    pkgs.tor-browser-bundle-bin
    pkgs.opera
    pkgs.ungoogled-chromium
    inputs.zen-browser.packages.x86_64-linux.default
  ];
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "text/html" = "zen.desktop";
    };
  };
}
