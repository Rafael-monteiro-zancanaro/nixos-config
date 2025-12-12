{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-zsh
  ];

  programs.oh-my-zsh = {
    enable = true;
    plugins = [ ];
    theme = "agnoster";
  };
}