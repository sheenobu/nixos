{ stdenv, pkgs, go16Packages }:
let
  dbus = go16Packages.buildFromGitHub {
    rev    = "230e4b23db2fd81c53eaa0073f76659d4849ce51";
    version = "2016-03-02";
    owner  = "godbus";
    repo   = "dbus";
    sha256 = "1wxv2cbihzcsz2z7iycyzl7f3arhhgagcc5kqln1k1mkm4l85z0q";
  };
in
go16Packages.buildFromGitHub {
  rev    = "7b2428fec40033549c68f54e26e89e7ca9a9ce31";
  version = "2016-03-10";
  owner  = "coreos";
  repo   = "go-systemd";
  sha256 = "0kfbxvm9zsjgvgmiq2jl807y4s5z0rya65rm399llr5rr7vz1lxd";
  nativeBuildInputs = [ pkgs.pkgconfig pkgs.systemd ];
  propagatedBuildInputs = [ dbus ];
}
