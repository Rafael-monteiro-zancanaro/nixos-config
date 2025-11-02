{ config, pkgs, ... }:

{
  imports = [
    ./plugins.nix
  ];
  home.packages = with pkgs; [
		jetbrains.idea-community
  ];

  programs.jetbrains.idea-community = {
    enable = true;
  };
}