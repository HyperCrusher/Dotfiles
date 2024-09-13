final: prev: {
  oh-my-posh = prev.oh-my-posh.overrideAttrs (oldAttrs: rec {
    version = "23.13.1";
    src = prev.fetchFromGithub {
      owner = "jandedobbeleer";
      repo = oldAttrs.pname;
      rev = "v${version}";
      hash = "sha256-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    };
  });
}
