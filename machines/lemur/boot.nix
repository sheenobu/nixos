{ config, ... }:
{
  boot = {
    loader = {
      gummiboot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
