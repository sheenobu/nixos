{ config, lib, pkgs, ... }:

with lib; # commands such as mkOption, types are within lib.

let
    cfg = config.services.elk; # this is an alias to config.services.elk that is used in our implementation below
in
{
   ###### interface

    options.services.elk = {
        enable = mkOption {
            description = "Whether to enable the ELK stack.";
            default = false;
            type = types.bool;
        };

        listenAddress = mkOption {
            description = "The IP address or host to listen on Kibana.";
            default = "127.0.0.1";
            type = types.str;
        };
   };

   ##### implementation

   config = mkIf cfg.enable {
        services.elasticsearch = {
            enable = true;
        };

        services.kibana = {
            enable = true;
            listenAddress = cfg.listenAddress;
        };
    };
}

