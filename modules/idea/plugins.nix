{ config, pkgs, ... }:
{
  programs.idea-community.addPlugins = with pkgs.jetbrains.plugins; [
    ideavim
  ];
}