{ config, pkgs, ... }:
{
  imports = [
    ./profiles.nix
  ];
  packages = with pkgs; [
    vscode
  ];

  programs.vscode = {
    enable = true;
  };
}