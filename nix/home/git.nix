{ config, ... }:

{
  imports =
    [
      ../nixconfig.nix
    ];

  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt"; # must have no password!

    secrets = {
      "git-credentials" = {
        format = "binary";
        path = "${config.home.homeDirectory}/.git-credentials";
        sopsFile = ../secrets/.git-credentials.enc;
      };
    };
  };

  # Git configuration
  programs.git = {
    enable = true;
    settings = {
      init = {
        defaultBranch = "main";
      };
      user = {
        email = config.nixconfig.git.email;
        name = config.nixconfig.git.username;
      };
      credential = {
        helper = "store --file ${config.sops.secrets."git-credentials".path}";
      };
    };
  };
}
