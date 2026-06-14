{ pkgs, ... }:

{
  # Social Media / Chat packages

  home.packages = with pkgs; [
    discord
  ];
}
