{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    (jetbrains.plugins.addPlugins jetbrains.idea-community [ "ideavim" ])
  ];
}