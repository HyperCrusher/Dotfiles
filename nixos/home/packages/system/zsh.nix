{ pkgs, config, ... }:
let
  zshDir = ".config/zsh";
  zshAbsDir = "${config.home.homeDirectory}/${zshDir}";
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
      path = "${zshAbsDir}/history";
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
      eval "$(oh-my-posh init zsh -c '${zshAbsDir}/omp.json')"

      export OMP_I=0
      precmd(){
        if (( OMP_I < 2 )); then
          (( OMP_I++ ))
        fi
      };
      clear(){
        command clear
        OMP_I=0
      };
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
      "rebuild" = "sudo nixos-rebuild switch --flake /etc/nixos#home-desktop";

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
        segments = [
          {
            type = "text";
            style = "plain";
            template = "{{ if eq .Env.OMP_I \"2\" }}\n{{ end }}";
          }
          {
            type = "path";
            style = "plain";
            foreground = "blue";
            background = "transparent";
            template = ''{{ if eq .PWD "/" }}/{{ else }}{{ if eq .PWD "~" }}~{{ else }}{{ if eq .Parent "/" }}/{{ .Folder }}{{ else }}{{base .Parent }}/{{ .Folder }}{{ end }}{{ end }}{{ end }}'';
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
