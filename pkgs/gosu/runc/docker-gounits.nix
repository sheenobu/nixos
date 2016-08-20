{ stdenv, go16Packages }:

go16Packages.buildFromGitHub {
  rev = "5d2041e26a699eaca682e2ea41c8f891e1060444";
  version = "2016-01-25";
  owner = "docker";
  repo = "go-units";
  sha256 = "0hn8xdbaykp046inc4d2mwig5ir89ighma8hk18dfkm8rh1vvr8i";
}
