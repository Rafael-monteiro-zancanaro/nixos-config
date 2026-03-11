{ home, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
  ];
}
