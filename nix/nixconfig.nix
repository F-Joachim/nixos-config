{ config, ... }:
{
  imports =
    [
      ./config/common.nix
    ];

  nixconfig.userdata = {
    username = "fjrhn";
    description = "Joachim Friedrich";
    home = "/home/${config.nixconfig.userdata.username}";
  };
  nixconfig.git = {
    username = config.nixconfig.userdata.description;
    email = "49515773+F-Joachim@users.noreply.github.com";
  };
}
