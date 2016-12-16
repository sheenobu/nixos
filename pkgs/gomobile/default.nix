{ stdenv, buildGoPackage, fetchgit,
  glibc, ncurses5, zlib,
  makeWrapper, patchelf
}:
let
  ncursesLibPath = stdenv.lib.makeLibraryPath [ ncurses5 ];
  zlibPath = stdenv.lib.makeLibraryPath [ zlib ];
in
buildGoPackage rec {
  name = "gomobile-${version}";
  version = "20161208-${stdenv.lib.strings.substring 0 7 rev}";
  rev = "e1ac2f46b872560992ddba08c2196e4dd64d07c4";

  goPackagePath = "golang.org/x/mobile";

  subPackages = [ "cmd/gomobile" ];

  buildInputs = [ makeWrapper ];

  # The gomobile-nix patch and LD_LIBRARY_PATH additions are
  # for supporting the downloaded binaries that gomobile installs
  # in $GOPATH/pkg/gomobile/android-ndk-... . Eventually we could
  # install android-ndk here as a dependency and patch
  # gomobile to support it (therefore removing the 'gomobile init' command).

  patches = [ ./gomobile-nix.patch ];

  postPatch = ''
    substituteInPlace cmd/gomobile/nix.go --replace "/usr/bin/patchelf" "${patchelf}/bin/patchelf"
    substituteInPlace cmd/gomobile/nix.go --replace "/lib64/ld-linux-x86-64.so.2" "${glibc}/lib/ld-linux-x86-64.so.2"
  '';

  postInstall = ''
      mkdir -p $bin/lib

      ln -s ${ncursesLibPath}/libncursesw.so.5 $bin/lib/libtinfo.so.5

      wrapProgram $bin/bin/gomobile \
        --prefix "LD_LIBRARY_PATH" : "${ncursesLibPath}" \
        --prefix "LD_LIBRARY_PATH" : "${zlibPath}" \
        --prefix "LD_LIBRARY_PATH" : "$bin/lib"
  '';

  src = fetchgit {
    inherit rev;
    url = "https://go.googlesource.com/mobile";
    sha256 = "1v5q73y9ms09nlfkkw1nxdxybfial0mivlr05x201arrnr3q18af";
  };

  meta = {
    description = "A tool for building and running mobile apps written in Go.";
    longDescription = "Gomobile is a tool for building and running mobile apps written in Go.";
    homepage = https://go.googlesource.com/mobile;
    license = stdenv.lib.licenses.bsd;
    maintainers = [ stdenv.lib.maintainers.sheenobu ];
    platforms = stdenv.lib.platforms.linux;
  };
}
