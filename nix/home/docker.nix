{ config, ... }:

{
  imports =
    [
      ../nixconfig.nix
    ];

  home = {
    sessionVariables = {
      DOCKER_BUILDKIT = 1;
    };
  };
}
