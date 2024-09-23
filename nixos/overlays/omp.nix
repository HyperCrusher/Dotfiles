final: prev: {
  oh-my-posh = prev.oh-my-posh.overrideAttrs (oldAttrs: rec {
    version = "23.14.1";
    src = prev.fetchFromGitHub {
      owner = "jandedobbeleer";
      repo = oldAttrs.pname;
      rev = "v${version}";
      hash = "sha256-yOp4DnPfigdpz32/78w+pjFXpsXEAK9N4Bvv2tmT6iI=";
    };
    vendorHash = "sha256-EBLfbdTV15wSTOThzBY0d2KrSJzRaB8vNH53Uwc+XfM=";
  });
}
