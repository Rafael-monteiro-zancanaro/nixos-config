{ config, pkgs, ... }:

{
  imports = [
    ./plugins.nix
  ];

  home.packages = with pkgs; [
    oh-my-zsh
  ];

  programs.oh-my-zsh = {
    enable = true;
    theme = "agnoster";
  };
}