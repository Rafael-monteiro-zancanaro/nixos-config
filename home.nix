{ config, pkgs, ... }:

{
  home.username = "zancanaro";
  home.homeDirectory = "/home/zancanaro";
  home.stateVersion = "25.11";

  imports = [
    ./modules/misc.nix
  ];

  home.packages = with pkgs; [
    curl
    htop
    cmatrix
    bat
    tree
    vscodium
    nixfmt
  ];
}
