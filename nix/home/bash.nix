{ config, ... }:

{

  home = {
    sessionVariables = {
      PATH = "$PATH:$HOME/bin:$HOME/.local/bin";
      TZ = "Europe/Berlin";
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    #    bashrcExtra = ''
    #    '';
    shellAliases = {
      ll = "ls -alF";
    };
  };
}
