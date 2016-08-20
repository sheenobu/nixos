{ stdenv, go16Packages }:

go16Packages.buildFromGitHub {
  rev    = "2c00daeb6c3b45114c80ac44119e7b8801fdd852";
  version = "2015-07-16";
  owner  = "syndtr";
  repo   = "gocapability";
  sha256 = "1x7jdcg2r5pakjf20q7bdiidfmv7vcjiyg682186rkp2wz0yws0l";
}
