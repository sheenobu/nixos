{ stdenv, go16Packages }:

go16Packages.buildFromGitHub {
  rev = "a632d6dc2806fa19d2f7693017d3fb79d3d8fa03";
  version = "2016-04-05";
  owner = "vishvananda";
  repo = "netlink";
  sha256 = "1m1aanxlsb1zqqxmdi528ma8c5k2h0hp6vk2nmplm6rldcnvyr4v";
}
