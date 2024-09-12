{ config, ... }:
let
  zshDir = ".config/zsh";
in
{
  programs.zsh = {
    enable = true;
    autocd = false;

    dotDir = zshDir;

    history = {
      size = 10000;
      path = "${zshDir}/history";
    };

    zplug = {
      enable = true;
      zplugHome = builtins.toPath "${config.home.homeDirectory}/${zshDir}/zplug";
      plugins = [
        {
          name = "zsh-users/zsh-autosuggestions";
        }
        {
          name = "zsh-users/zsh-syntax-highlighting";
        }
        {
          name = "zsh-users/zsh-completions";
        }
        {
          name = "zsh-users/zsh-history-substring-search";
        }
        {
          name = "ChrisPenner/copy-pasta";
        }
        {
          name = "mdumitru/fancy-ctrl-z";
        }
        {
          name = "jeffreytse/zsh-vi-mode";
        }
      ];
    };

    initExtra = ''
      typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ad8ee6" 
      typeset -g ZSH_AUTOSUGGEST_STRATEGY=(completion)

      PROMPT='%F{blue}%2~ %F{green}> '
      RPROMPT="%F{#acb0d0}%t"
    '';

    shellAliases = {
      "ls" = "exa";
      "lsa" = "exa -a";
      "lt" = "exa --tree --level=2";

      "grep" = "grep --color=auto";
      "mkdir" = "mkdir -pv";

      "chown" = "chown --preserve-root";
      "chmod" = "chmod --preserve-root";
      "chgrp" = "chgrp --preserve-root";

      ".." = "cd ../";
      "." = "cd ~";

      # Nix related things
      "dotfiles" = "cd /etc/nixos";
      "nix-update" = "git pull && sudo nix-rebuild switch --flake .#home-desktop";

      # lsblk but with sensible outputs
      "lsblk" = "lsblk --output name,label,size,rota,mountpoints,fstype";
    };
  };
}
