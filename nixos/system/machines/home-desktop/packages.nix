{ pkgs, ... }:
{
  programs = {
    npm = {
      enable = true;
      npmrc = ''''${HOME}/.config/npm-packages'';
    };

    virt-manager.enable = true;

    firejail = {
      enable = true;
    };

    gamemode = {
      enable = true;
      enableRenice = true;
    };

    steam = {
      enable = true;
      protontricks.enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };

  services = {
    tumbler.enable = true;
  };

}
