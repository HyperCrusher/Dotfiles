{ user, ... }:
{
  programs = {
    git = {
      enable = true;
      userEmail = user.email;
      userName = user.name;
    };
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
    lazygit.enable = true;
  };
}
