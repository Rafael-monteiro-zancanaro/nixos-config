{ config, pkgs, ... }:

{
  imports = [
    ./packages/misc.nix
  ];

  home.username = "zancanaro";
  home.homeDirectory = "/home/zancanaro";
  home.stateVersion = "25.11";

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
