{ stdenv, go16Packages, gojsonschema }:

go16Packages.buildFromGitHub {
  rev = "53f0da5e98284a39b3aaa04d5be6730924380686";
  version = "2016-04-14";
  owner = "opencontainers";
  repo = "runtime-spec";
  sha256 = "1vxhbp8rcws4kix1v0pmrbg4x1k7zmsyq1an9526q4jdrdckp7kb";
  propagatedBuildInputs = [ gojsonschema ];
}
