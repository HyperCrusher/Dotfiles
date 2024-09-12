{ user, pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      ${user.name_lower} = {
        isNormalUser = true;
        home = "/home/${user.name_lower}";
        description = "${user.name}";
        initialPassword = "changeme";
        extraGroups = [
          "flatpak"
          "disk"
          "qemu"
          "kvm"
          "docker"
          "wireshark"
          "libvirtd"
          "networkmanager"
          "wheel"
          "audio"
          "video"
        ];
      };
      work = {
        isNormalUser = true;
        home = "/home/work";
        description = "Work";
        initialPassword = "changeme";
        extraGroups = [
          "flatpak"
          "wheel"
        ];
      };
    };
  };
}
