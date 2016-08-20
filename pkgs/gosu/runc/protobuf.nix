{ stdenv, go16Packages }:

go16Packages.buildFromGitHub {
  rev = "59b73b37c1e45995477aae817e4a653c89a858db";
  version = "2015-08-23";
  owner = "golang";
  repo = "protobuf";
  sha256 = "1dx22jvhvj34ivpr7gw01fncg9yyx35mbpal4mpgnqka7ajmgjsa";
  goPackagePath = "github.com/golang/protobuf";
  goPackageAliases = [ "code.google.com/p/goprotobuf" ];
};
