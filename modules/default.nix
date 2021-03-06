{ config, pkgs, lib, ... }:
{

  imports = [
    ./xdg.nix
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
    unzip

    # sec (just install both gpg 1 and 2, they say)
    gnupg1

    # hardware
    usbutils
    pciutils

    # nix
    nix-repl
    nixops
    nox
    (pkgs.callPackage ../pkgs/nix-home {})

    #nix-prefetch-zip
    nix-prefetch-git
    patchelf

    # programming
    ack
    git
    gitAndTools.gitflow
    mercurial
    gnumake

    # manpages
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

  nix = rec {
    # use nix sandboxing for greater determinism
    useSandbox = true;
  };
}
