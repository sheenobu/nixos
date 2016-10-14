{ stdenv, fetchgit }:
let
  copyFilesInstallPhase = ''
    mkdir $out
    cp -a . $out
  '';
in
stdenv.mkDerivation rec {
  rev = "c470a6f63de1cd00822c072c26df39ab3395c55f";
  name = "vim-vala-${rev}";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/tkztmk/vim-vala.git";
    sha256 = "1scn6xx7sp2iaqipffl8pgl3v8l1zpf1qd0g522m69sr1m1ny167";
  };

  installPhase = copyFilesInstallPhase;

  meta = with stdenv.lib; {
    description = "Vim configuration files for Vala";
    longDescription = ''
      vim-vala is a Vim syntax, indent and ftdetect files
      for Vala. It is mainly from https://live.gnome.org/Vala/Vim.
    '';
    homepage = https://github.com/tkztmk/vim-vala;
    platforms = platforms.unix;
    maintainer = with maintainers; [ sheenobu ];
  };
}


