{ user, pkgs, ... }:
{
  networking = {
    hostName = "${user.name}";
    wireless.enable = false;
    networkmanager.enable = true;
    enableIPv6 = true;
    firewall.enable = false;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    mtr
    whois
    nfs-utils
    protonvpn-cli
    gnupg
    python3Packages.pyxdg
  ];
}
