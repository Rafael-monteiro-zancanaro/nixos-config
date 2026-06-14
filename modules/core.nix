{ pkgs, ... }:

{
  home.packages = with pkgs; [
    curl
    htop
    bat
    tree
    fastfetch
    gcc
    xournalpp
  ];
}
