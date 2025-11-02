{ config, pkgs, ... }:
{
  imports = [
    ./profiles.nix
  ];
  home.packages = with pkgs; [
    vscode
  ];

  programs.vscode = {
    enable = true;
  };
}
