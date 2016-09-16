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

  meta = with stdenv.lib; {
    description = "Go development plugin for Vim";
    longDescription = ''
      Go (golang) support for Vim, which comes with pre-defined sensible settings
      (like auto gofmt on save), with autocomplete, snippet support, improved syntax
      highlighting, go toolchain commands, and more. If needed vim-go installs
      all necessary binaries for providing seamless Vim integration with
      current commands. It's highly customizable and each individual feature
      can be disabled/enabled easily.
    '';
    homepage = https://github.com/fatih/vim-go;
    license = licenses.bsd3;
    platforms = platforms.unix;
    maintainer = with maintainers; [ sheenobu ];
  };
}


