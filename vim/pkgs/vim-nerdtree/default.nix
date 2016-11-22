{ stdenv, fetchFromGitHub }:
let
  copyFilesInstallPhase = ''
    mkdir -p $out/share/vim/
    cp -a . $out/share/vim/
  '';
in
stdenv.mkDerivation rec {
  rev = "5.0.0";
  name = "vim-nerdtree";
  src = fetchFromGitHub {
    owner = "scrooloose";
    repo = "nerdtree";
    rev = "${rev}";
    sha256 = "1dpfzbz02a47g84j5nxhb0qahpzg1fwnm4qyabjni2faz73v7ddk";
  };
  installPhase = copyFilesInstallPhase;

  meta = with stdenv.lib; {
    description = "NerdTree";
    platforms = platforms.unix;
    maintainer = with maintainers; [ sheenobu ];
  };
}



