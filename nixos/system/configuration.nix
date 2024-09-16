{
  inputs,
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
      inputs.neovim-nightly-overlay.overlays.default
      (import ../overlays/omp.nix)
    ];
  };

  boot = {
    loader = {
      grub = {
        device = "nodev";
        efiSupport = true;
        efiInstallAsRemovable = true;
        enable = true;
        timeoutStyle = "menu";
      };
    };
  };
}
