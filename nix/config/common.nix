{ lib, ... }:
with lib;
with types;
{
  options.nixconfig = {
    userdata = {
      username = mkOption {
        type = str;
        default = "";
        description = ''
        '';
      };
      description = mkOption {
        type = str;
        default = "";
        description = ''
        '';
      };
      home = mkOption {
        type = str;
        default = "";
        description = ''
        '';
      };
    };
    proxy = {
      noProxy = mkOption {
        type = str;
        default = "";
        description = ''
              '';
      };
      cntlm = {
        listenIp = mkOption {
          type = str;
          default = "";
          description = ''
          '';
        };
        listenPort = mkOption {
          type = int;
          default = "";
          description = ''
          '';
        };
        noProxy = mkOption {
          type = str;
          default = "";
          description = ''
          '';
        };
        workstation = mkOption {
          type = str;
          default = "";
          description = ''
          '';
        };
      };
    };
    git = {
      email = mkOption {
        type = str;
        default = "";
        description = ''
        '';
      };
      username = mkOption {
        type = str;
        default = "";
        description = ''
        '';
      };
    };
  };
}
