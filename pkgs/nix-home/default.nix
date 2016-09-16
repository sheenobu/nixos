{ stdenv, python, fetchFromGitHub }:
stdenv.mkDerivation rec {
  version = "0.1.1";
  name = "nix-home-${version}";

  src = fetchFromGitHub {
    rev = version;
    repo = "nix-home";
    owner = "sheenobu";
    sha256 = "0bim4spz23c2nrz0vx9i1nrilq95kmc1d7rigdgr5f202wp08b0h";
  };

  patchPhase = ''
    substituteInPlace nix-home --replace "NIXHOME" "$out/nix/lib"
    substituteInPlace lib/nixhome/builder.sh --replace writeFiles.py "$out/nix/lib/writeFiles.py"
    substituteInPlace lib/nixhome/builder.sh --replace python "${python}/bin/python"
  '';

  installPhase = ''
    # install binary
    mkdir -p $out/bin
    cp nix-home $out/bin
    chmod +x $out/bin/nix-home

    # install nix-home lib
    mkdir -p $out/nix
    cp -a lib $out/nix
  '';

  meta = {
    homepage = https://github.com/sheenobu/nix-home;
    description = "Per-user configuration management via Nix";
    license = stdenv.lib.license.mit;
    platforms = stdenv.lib.platforms.unix;
    inherit version;
  };
}

