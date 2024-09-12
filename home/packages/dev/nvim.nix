{ pkgs, lib, ... }:
{
  # Shell, nix, lua, yaml and json tools should always be present
  home.packages = with pkgs; [
    shellcheck # Shell
    shfmt
    luaformatter # Lua
    lua53Packages.lua-lsp
    deadnix # Nix
    nil
    statix
    nixfmt-rfc-style
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
    source = ../../../dotfiles/nvim/.config/nvim;
    recursive = true;
  };
}
