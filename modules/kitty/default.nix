{ config, pkgs, ... }:

{
  imports = [
    ./xdg-config.nix
  ];

  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
  };
}