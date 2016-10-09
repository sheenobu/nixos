{ stdenv, fetchgit }:
let
  copyFilesInstallPhase = ''
    mkdir $out
    cp -a . $out
  '';
in
stdenv.mkDerivation rec {
  rev = "a61495a762feacc00f24cab4392b09cc3250decf";
  name = "vim-nix-${rev}";

  src = fetchgit {
    url = "https://github.com/LnL7/vim-nix.git";
    rev = "a61495a762feacc00f24cab4392b09cc3250decf";
    sha256 = "0icq9nawm6s4qzb9q62y3fdq4ixbfwmmgk141fnfqzq6ya1azxac";
  };

  installPhase = copyFilesInstallPhase;

  meta = with stdenv.lib; {
    description = "Vim configuration files for Nix";
    longDescription = ''
	Support for writing Nix expressions in vim. Features included so far:
	Syntax highlighting for Nix, Filetype detection for .nix files, Automatic indentation.
    '';
    homepage = https://github.com/LnL7/vim-nix;
    license = licenses.mit;
    platforms = platforms.unix;
    maintainer = with maintainers; [ sheenobu ];
  };
}


