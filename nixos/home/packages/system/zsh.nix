{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autocd = false;

    dotDir = ".config/zsh";

    history = {
      size = 10000;
    };
    zplug = {
      enable = true;
      zplugHome = "$ZDOTDIR/.zsh_history";
      plugins = [
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-completions"
        "zsh-users/zsh-history-substring-search"
        "ChrisPenner/copy-pasta"
        "mdumitru/fancy-ctrl-z"
        "jeffreytse/zsh-vi-mode"
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
