{
  inputs,
  user,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = {
      inherit
        inputs
        user
        pkgs
        ;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      ${user.name_lower} = import ../../../home/users/user.nix { inherit inputs user pkgs; };
      work = import ../../../home/users/work.nix { inherit inputs user pkgs; };
    };

  };
}
