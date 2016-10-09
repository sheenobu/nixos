{ stdenv, fetchgit }:
stdenv.mkDerivation rec {
  rev = "0e0d35ac";
  name = "tomorrow-night-${rev}";

  #TODO: not a fan of pulling the full repo just for vim colors
  src = fetchgit {
    inherit rev;
    url = "https://github.com/chriskempson/tomorrow-theme.git";
    sha256 = "1afhfnp5ns8iwhf9yc8mgcnkycqwkczzifnwin48ml2vijl14nr2";
  };

  installPhase = ''
    mkdir -p $out/share/vim/colors/
    cp vim/colors/*.vim $out/share/vim/colors
  '';

  meta = with stdenv.lib; {
    description = "A bright theme with pastel colours and sensible syntax highlighting.";
    longDescription = ''
      After having spent over five years using, tweaking and
      refining a personal editor theme I decided it was
      time to release "Tomorrow Theme" - a bright theme
      with pastel colours and sensible syntax highlighting.
      A theme should not get in your way but should aid
      your programming with easily identifiable colours
      that add meaning and enhance legibility.
      This was the main focus when developing Tomorrow.
    '';
    homepage = https://github.com/chriskempson/tomorrow-theme;
    license = licenses.mit;
    platforms = platforms.unix;
    maintainer = with maintainers; [ sheenobu ];
  };
}


