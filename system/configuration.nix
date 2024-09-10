{
  inputs,
  pkgs,
  machine,
  ...
}:
{
  imports = [
    ./common
    ./machines/${machine}
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      inputs.neovim-nightly-overlay.overlay
    ];
  };

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        device = "nodev";
        efiSupport = true;
        enable = true;
        useOSProber = true;
        timeoutStyle = "menu";
      };
    };
  };
}
