{ stdenv }:
stdenv.mkDerivation {
  name = "osu";

  buildInputs = [ ];

  src = ./osu-src;

  preBuild = ''
  #substituteInPlace osu-open-file --replace "winepath" "$\{wine\}/bin/winepath"
  #substituteInPlace osu-open-file --replace "wine" "$\{wine\}/bin/wine"
    substituteInPlace osz.desktop --replace "osu-open-file" "$out/bin/osu-open-file"
  '';

  installPhase = ''

    mkdir -p $out/bin/
    cp osu-open-file $out/bin
    chmod +x $out/bin/osu-open-file

    mkdir -p $out/share/mime/packages
    cp x-osz.xml $out/share/mime/packages/osu-x-osz.xml

    mkdir -p $out/share/applications/
    cp osz.desktop $out/share/applications/osz.desktop
  '';
}

