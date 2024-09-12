{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Shell, yaml and json tools should always be present
  home.packages = with pkgs; [
    shellcheck # Shell
    shfmt
    taplo # Toml,yaml,json
    yamllint
    yq
    nodePackages.jsonlint
    fixjson
    gcc # gcc so nvim can build plugins
  ];
  programs = {
    neovim = {
      enable = true;
      package = pkgs.neovim;
      vimAlias = true;
      vimdiffAlias = true;

      extraWrapperArgs = [
        "--prefix"
        "PATH"
        ":"
        "${lib.makeBinPath [ pkgs.gcc ]}"
      ];
    };
  };

  xdg.configFile.nvim = {
    source = "${inputs.dotfiles}/nvim/.config/nvim";
    recursive = true;
  };
}
