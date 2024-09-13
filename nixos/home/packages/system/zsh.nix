{ pkgs, ... }:
let
  zshDir = ".config/zsh";
in
{
  programs.oh-my-posh = {
    enable = true;
    package = pkgs.oh-my-posh;
  };

  programs.zsh = {
    enable = true;
    autocd = false;

    dotDir = zshDir;

    history = {
      size = 10000;
      path = "${zshDir}/history";
    };

    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-autosuggestions kind:defer"
        "zsh-users/zsh-syntax-highlighting kind:defer"
        "clarketm/zsh-completions kind:defer"
        "zsh-users/zsh-history-substring-search kind:defer"
        "ChrisPenner/copy-pasta kind:defer"
        "mdumitru/fancy-ctrl-z kind:defer"
        "jeffreytse/zsh-vi-mode kind:defer"
      ];
    };

    initExtra = ''
      typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ad8ee6" 
      typeset -g ZSH_AUTOSUGGEST_STRATEGY=(completion)
      eval "$(oh-my-posh init zsh -c '${zshDir}/omp.json')"
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
  home.file."${zshDir}/omp.json".text = builtins.toJSON {
    "$schema" = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json";
    final_space = true;
    version = 2;
    blocks = [
      {
        type = "prompt";
        alignment = "left";
        newline = true;
        segments = [
          {
            type = "path";
            style = "plain";
            foreground = "blue";
            background = "transparent";
            template = "{{ if eq .PWD \"~\" }}~{{ else }}{{ base .Parent }}/{{ .Folder }}{{ end }}";
          }
        ];
      }
      {
        type = "prompt";
        alignment = "left";
        newline = true;
        segments = [
          {
            type = "text";
            style = "plain";
            background = "transparent";
            foreground = "magenta";
            template = " ";
          }

        ];
      }
    ];
    transient_prompt = {
      foreground = "magenta";
      background = "transparent";
      template = " ";
    };
  };
}
