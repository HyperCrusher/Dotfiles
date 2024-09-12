{ pkgs, lib, ... }:

let
  makeFirejailWrapper =
    pkg: originalBin: newName: extraArgs:
    pkgs.writeShellScriptBin newName ''
      exec ${pkgs.firejail}/bin/firejail --net=none ${lib.escapeShellArgs extraArgs} ${pkg}/bin/${originalBin} "$@"
    '';
in
{
  home.packages = with pkgs; [
    wpsoffice
    (makeFirejailWrapper pkgs.wpsoffice "et" "spreadsheets" [ ])
    (makeFirejailWrapper pkgs.wpsoffice "wps" "writer" [ ])
    (makeFirejailWrapper pkgs.wpsoffice "wpp" "powerpoint" [ ])
    (makeFirejailWrapper pkgs.wpsoffice "wpspdf" "pdf" [ ])
  ];

  home.file.".local/bin/spreadsheets".source = "${
    makeFirejailWrapper pkgs.wpsoffice "et" "spreadsheets" [ ]
  }/bin/spreadsheets";
  home.file.".local/bin/word".source = "${
    makeFirejailWrapper pkgs.wpsoffice "wps" "writer" [ ]
  }/bin/word";
  home.file.".local/bin/presentation".source = "${
    makeFirejailWrapper pkgs.wpsoffice "wpp" "powerpoint" [ ]
  }/bin/presentation";
  home.file.".local/bin/pdf".source = "${
    makeFirejailWrapper pkgs.wpsoffice "wpspdf" "pdf" [ ]
  }/bin/pdf";
}
