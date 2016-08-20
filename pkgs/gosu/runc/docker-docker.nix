{ stdenv, go16Packages, go-units }:

go16Packages.buildFromGitHub {
  rev = "cb87b6eb6a955e5a66b17e0a15557f37f76b85c0";
  version = "2016-04-14";
  owner = "docker";
  repo = "docker";
  sha256 = "1hkah4scs8a589jhp82kw5wcx21nhq41asfq8icwy6bzdz1bq0j0";
  buildInputs = [ go-units ];
  subPackages = [ "pkg/term" "pkg/symlink" "pkg/system" "pkg/mount" ];
}
