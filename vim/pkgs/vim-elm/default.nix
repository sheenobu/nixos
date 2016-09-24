{ stdenv, fetchgit }:
let
  copyFilesInstallPhase = ''
    mkdir $out
    cp -a . $out
  '';
in
stdenv.mkDerivation rec {
  rev = "04df290";
  name = "vim-elm-${rev}";
  src = fetchgit {
    url = "https://github.com/lambdatoast/elm.vim.git";
    sha256 = "1wkz5r8h6f4i0rhar787p4dvs6j02zxl9ki24pczgwql6j1dgkhp";
    inherit rev;
  };

  installPhase = copyFilesInstallPhase;

  meta = with stdenv.lib; {
    description = "Vim plugin for the Elm programming language";
    homepage = https://github.com/lambdatoast/elm.vim;
    license = licenses.mit;
    platforms = platforms.unix;
    maintainer = with maintainers; [ sheenobu ];
  };
}


