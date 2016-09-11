{ config, pkgs, ... }:
{
    nixpkgs.config.packageOverrides = pkgs: {
      asterisk = pkgs.stdenv.lib.overrideDerivation pkgs.asterisk  (oldAttrs: rec {
        version = "13.10.0";
        name = "asterisk-${version}";
        src = pkgs.fetchurl {
          url = "http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-${version}.tar.gz";
          sha256 = "1cqkjm3bq0rslyka5bjqf89iwgs8sqd2l6hcx8dcp9kz0q0mv95b";
        };
      });
    };
}
