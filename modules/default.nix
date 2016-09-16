{ config, pkgs, lib, ... }:
{

  imports = [
    ./xdg.nix
    ./asterisk.nix
    ./custompkgs.nix
    ./elk.nix
    ./users.nix
  ];


  # let's make sure only NixOS can handle users
  #users.mutableUsers = false;

  # see https://github.com/NixOS/nixpkgs/commit/ee8e15fe76a235ae3583d4e8cb4bb370f28c5eae
  programs.bash.enableCompletion = true;

  # Common Packages
  environment.systemPackages = with pkgs; [
    # core
    wget
    tmux
    curl
    wget
    w3m
    file
    autojump
    unrar
    socat
    binutils
    neovim
    socat
    tree
    psmisc

    # sec (just install both gpg 1 and 2, they say)
    gnupg
    gnupg1

    # hardware
    usbutils
    pciutils

    # nix
    nix-repl
    nixops
    nox
    sheenobupkgs.nix-home
    nix-prefetch-zip
    nix-prefetch-git

    # programming
    ack
    git
    gitAndTools.gitflow
    mercurial
    go_1_6
    gnumake

    # manpages
    manpages
    posix_man_pages
  ];

  # editor is always nvim
  environment.variables.EDITOR = "nvim";

  # every machine should be running antivirus
  services = {
    clamav = {
      updater.enable = true;
    };
  };

#  nix = rec {
#    # allow users to use nix-env
#    nixPath = [ "nixpkgs=http://nixos.org/channels/nixos-16.03/nixexprs.tar.xz" ];
#
#    # use nix sandboxing for greater determinism
#    useChroot = true;
#  };
}
