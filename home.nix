{ config, pkgs, ... }:

{
  home.username = "zancanaro";
  home.homeDirectory = "/home/zancanaro";
  home.stateVersion = "25.11";

  imports = [
    ./modules/misc.nix
    ./modules/social.nix
    ./modules/ide.nix
  ];

  home.packages = with pkgs; [
    curl
    htop
    cmatrix
    bat
    tree
    vscodium
    nixfmt
    gcc
  ];
}
