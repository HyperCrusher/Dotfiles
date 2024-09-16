{ config, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enabled = false;
      };
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };
}
