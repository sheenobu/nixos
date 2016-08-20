{ stdenv, callPackage, go16Packages, go, docker, libapparmor, apparmor-parser, libseccomp }:
let

  # backport from master

  netlink = (callPackage ./netlink.nix {});
  docker-go-units = (callPackage ./docker-gounits.nix {});
  gocapability = (callPackage ./gocapability.nix {});
  gojsonschema = (callPackage ./gojsonschema.nix) {};
  runtime-spec = (callPackage ./runtime-spec.nix) {
    inherit gojsonschema;
  };
  docker-docker = (callPackage ./docker-docker.nix) {
    go-units = docker-go-units;
  };
  go-systemd = (callPackage ./go-systemd.nix) {};

  cli-go = go16Packages.buildFromGitHub {
    rev    = "71f57d300dd6a780ac1856c005c4b518cfd498ec";
    owner  = "codegangsta";
    repo   = "cli";
    sha256 = "1fxznirkvank5461789dm5aw5z8aqi0jvwligvz44659rfl376p3";
    propagatedBuildInputs = [ go16Packages.yaml-v2 ];
  };

  # in release-16.03
  protobuf   = go16Packages.protobuf;
  logrus     = go16Packages.logrus;
in

go16Packages.buildFromGitHub {
  rev = "d1e00150320329da347de8ec830618c697c3df79";
  version = "2016-04-14";
  owner = "opencontainers";
  repo = "runc";
  sha256 = "18dhbb1d25s4cpikrari2ws3w7x92r6yxj4si64h9y177wmn6kml";
  propagatedBuildInputs = [
    go-systemd runtime-spec protobuf gocapability
    docker-go-units go16Packages.logrus docker-docker netlink cli-go
  ];
}

