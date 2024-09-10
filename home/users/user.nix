{ user, ... }:
{
  # I want everything to be 'opt-in' and so I dont want too many default.nix's
  imports = [
    ../packages/wms/bspwm.nix
    ../packages/crypto.nix
    ../packages/gaming.nix
    ../packages/office.nix
    ../packages/dev/core.nix
    ../packages/dev/gamedev.nix
    ../packages/media/default.nix
    ../packages/social/default.nix
    ../packages/system/default.nix
    ../packages/torrent.nix
  ];

  home = {
    username = "${user.name_lower}";
    homeDirectory = "/home/${user.name_lower}";
    stateVersion = "23.11";
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  programs = {
    home-manager.enable = true;
  };
}
