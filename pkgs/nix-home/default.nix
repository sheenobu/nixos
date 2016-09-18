{ stdenv, python, fetchFromGitHub }:
stdenv.mkDerivation rec {
  version = "0.2.0";
  name = "nix-home-${version}";

  src = fetchFromGitHub {
    rev = version;
    repo = "nix-home";
    owner = "sheenobu";
    sha256 = "1g3yf48814p2407m20m73n8rs1hpax2k8lvnfqq29kj1zylpfd1w";
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

