{ config, ... }:

{

  imports =
    [
      ../nixconfig.nix
    ];

  # Configure the firewall to allow Docker traffic on the cntlm port
#   networking.firewall = {
#     enable = true;
#     allowedTCPPorts = [ config.nixconfig.proxy.cntlm.listenPort ];
#   };

  virtualisation.docker = {
    enable = true;
  };
}
