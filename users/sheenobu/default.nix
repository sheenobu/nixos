with import <nixpkgs> {};
with import <nixhome> { inherit stdenv; inherit pkgs; };
with import /etc/nixos.git/vim { inherit lib; };
let

  go = pkgs.go_1_6;

  copyFilesInstallPhase = ''
    mkdir $out
    cp -a . $out
  '';

  rcfiles = stdenv.mkDerivation {
    name = "sheenobu-rcfiles";
    src = ./rcfiles;
    installPhase = copyFilesInstallPhase;
  };

  rofiScheme = ''
rofi.color-enabled: true
rofi.color-window: #273238, #273238, #1e2529
rofi.color-normal: #273238, #c1c1c1, #273238, #394249, #ffffff
rofi.color-active: #273238, #80cbc4, #273238, #394249, #80cbc4
rofi.color-urgent: #273238, #ff1844, #273238, #394249, #ff1844
  '';

  urxvtScheme = ''
urxvt.background: #000000
urxvt.foreground: #D3D2D3
urxvt.color0: #000000
urxvt.color1: #FF7768
urxvt.color2: #ABFA68
urxvt.color3: #FFFD88
urxvt.color4: #98D0FE
urxvt.color5: #FF85FD
urxvt.color6: #CACBFE
urxvt.color7: #EFEFEF
urxvt.color8: #848484
urxvt.color9: #FFBCB5
urxvt.color10: #D1FCB1
urxvt.color11: #FFFDD0
urxvt.color12: #BADFFF
urxvt.color13: #FFA9FE
urxvt.color14: #E2E3FE
urxvt.color15: #FFFFFF
urxvt.scrollBar: false
urxvt*font: xft:DejaVu Sans Mono:size=12:antialias=true:style=Book
  '';

in
mkHome {
  user = "sheenobu";
  files = {

    ###### shell start

    ".bashrc".content = ''
        source ${rcfiles}/bashrc/bashrc

        export GOPATH=~/go
        export GOROOT=${go}/share/go/
        export PATH=$PATH:$GOPATH/bin

        export GPG_TTY=$(tty)
      '';

    ".bash_profile".content = ''
        source ${rcfiles}/bashrc/bashrc

        export GOPATH=~/go
        export GOROOT=${go}/share/go/
        export PATH=$PATH:$GOPATH/bin

        export GPG_TTY=$(tty)
      '';

    ##### X11

    ".Xdefaults" = pkgs.writeText "Xdefaults" ''
      ${rofiScheme}
      ${urxvtScheme}
    '';

    ###### git

    ".gitconfig" = "${rcfiles}/gitconfig";

    ###### neovim config

    ".config/nvim/init.vim" = "${rcfiles}/nvimrc";
    ".nvim/bundle/vim-go" = vimPackages.vimGo;
    ".nvim/bundle/vim-nix" = vimPackages.vimNix;
    ".nvim/bundle/tomorrow-night" = "${vimThemes.tomorrowNight}/share/vim";


  };

}
