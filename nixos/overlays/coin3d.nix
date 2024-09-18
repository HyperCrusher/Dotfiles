final: prev: {
  coin3d = prev.coin3d.overrideAttrs (oldAttrs: rec {
    version = "4.0.3";
    src = prev.fetchFromGitHub {
      owner = "coin3d";
      repo = "coin";
      rev = "v${version}";
      hash = "sha256-dUFmcUOdNc3ZFtr+Hnh3Q3OY/JA/WxmiRJiU2RFSSus=";
    };
  });
}
