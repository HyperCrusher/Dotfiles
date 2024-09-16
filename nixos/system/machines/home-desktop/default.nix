{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ./network.nix
    ./home-manager.nix
    ./packages.nix
    ./video.nix
    ./wm.nix
  ];

  hardware.bluetooth.enable = true;

  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;

  powerManagement.cpuFreqGovernor = "performance";
}
