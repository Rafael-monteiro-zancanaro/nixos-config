{ pkgs, ... }:

{
  # Core Packages - Important programs for the system
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
