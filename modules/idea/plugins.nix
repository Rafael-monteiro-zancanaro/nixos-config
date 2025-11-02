{ config, pkgs, ... }:
{
  packages.idea-community.addPlugins = with pkgs.jetbrains.plugins; [
    "ideavim"
  ];
}