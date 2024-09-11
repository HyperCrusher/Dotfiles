{
  pkgs,
  inputs,
  system,
  ...
}:
{
  nixpkgs.config.joypixels.acceptLicense = true;
  fonts.packages = with pkgs; [
    source-han-sans
    source-han-sans-vf-otf
    source-sans-pro
    office-code-pro
    cantarell-fonts
    terminus-nerdfont
    inconsolata-nerdfont
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "Inconsolata"
        "Iosevka"
        "JetBrainsMono"
        "LiberationMono"
        "NerdFontsSymbolsOnly"
        "Terminus"
        "SourceCodePro"
      ];
    })
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    baekmuk-ttf
    ttf_bitstream_vera
    comic-mono
    dejavu_fonts
    joypixels
    liberation_ttf
    corefonts
    vistafonts
    texlivePackages.opensans

    inputs.wpsFonts.packages.${system}.default
  ];
}
