final: prev: {
  oh-my-posh = prev.oh-my-posh.overrideAttrs (oldAttrs: rec {
    version = "23.13.1";
    src = prev.fetchFromGitHub {
      owner = "jandedobbeleer";
      repo = oldAttrs.pname;
      rev = "v${version}";
      hash = "sha256-yGL7WX9b8ogB5CsfrkEJqmB6JxYQdpQ19wGptSAteXM=";
    };
    vendorHash = "sha256-EBLfbdTV15wSTOThzBY0d2KrSJzRaB8vNH53Uwc+XfM=";
  });
}
