{ stdenv, fetchFromGitHub, buildGoPackage }:

buildGoPackage rec {
  name = "go.gb-${rev}";
  goPackagePath = "github.com/constabulary/gb";
  rev = "v0.4.0";

  excludedPackages = "testdata";

  src = fetchFromGitHub {
    inherit rev;
    owner = "constabulary";
    repo = "gb";
    sha256 = "0hi6hm2jm77f8r5klnq2f051s6z6b71ikqhiay1r32x0qlaansdg";
  };
}
