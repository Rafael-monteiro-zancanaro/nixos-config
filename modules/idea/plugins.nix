{ config, pkgs, ... }:
{
  home.packages.idea-community.addPlugins = with pkgs.jetbrains.plugins; [
    ideavim
  ];
}