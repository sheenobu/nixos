{ config, ... }:
{
  boot = {
    loader = {
      gummiboot.enable = true;
      #systemd-boot.enable = true; 16.09
      efi.canTouchEfiVariables = true;
    };
  };
}
