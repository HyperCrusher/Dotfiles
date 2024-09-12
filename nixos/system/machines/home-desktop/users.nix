{ user, pkgs, ... }:
{
  users = {
    users = {
      ${user.name_lower} = {
        isNormalUser = true;
        shell = pkgs.zsh;
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
        shell = pkgs.zsh;
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
