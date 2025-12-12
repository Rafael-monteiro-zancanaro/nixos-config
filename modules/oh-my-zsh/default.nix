{ config, pkgs, ... }:

{
  imports = [
    ./plugins.nix
  ];

  home.packages = with pkgs; [
    oh-my-zsh
  ];

  programs.zsh.ohMyZsh = {
    enable = true;
    theme = "agnoster";
  };
}