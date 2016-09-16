{ stdenv, fetchFromGitHub }:
let
  copyFilesInstallPhase = ''
    mkdir $out
    cp -a . $out
  '';
in
stdenv.mkDerivation rec {
  rev = "1.9";
  name = "vim-go-${rev}";
  src = fetchFromGitHub {
    owner = "fatih";
    repo = "vim-go";
    rev = "v${rev}";
    sha256 = "0fi4gnr642fy4rgql6n3m03fdg3g53yp1yndz313yxmdsb1nd8bp";
  };
  installPhase = copyFilesInstallPhase;
}


