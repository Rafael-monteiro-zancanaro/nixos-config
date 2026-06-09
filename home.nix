{ config, pkgs, ... }:

{
  home.username = "zancanaro";
  home.homeDirectory = "/home/zancanaro";
  home.stateVersion = "25.11";

  imports = [
    ./modules/misc.nix
    ./modules/social.nix
    ./modules/ide.nix
    ./modules/lazyvim.nix
    ./shell-aliases.nix
    ./modules/languages.nix
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
    xournalpp
    pcsx2
    ventoy-full
  ];
}
