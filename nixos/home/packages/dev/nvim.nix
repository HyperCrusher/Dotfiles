{
  pkgs,
  lib,
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
    gcc # Deps so that nvim can build plugins
    tree-sitter
    gnumake
    rustc
    cargo
    lua
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
    source = ../../../../dotfiles/nvim;
    recursive = true;
  };
}
