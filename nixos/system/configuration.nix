{
  inputs,
  machine,
  pkgs,
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
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    kernelParams = [
      "reboot=acpi"
    ];
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
