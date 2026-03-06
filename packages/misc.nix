{ home, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    todoist
    obs-studio
  ];
}