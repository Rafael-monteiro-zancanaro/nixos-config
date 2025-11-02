{ config, pkgs, ... }:

{
  imports = [
    ./plugins.nix
  ];
  home.programs = with pkgs; [
		jetbrains.idea-community
  ];

  programs.jetbrains.idea-community = {
    enable = true;
  };
}