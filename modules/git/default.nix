{ config, pkgs, ... }:
{
  imports = [
    ./aliases.nix
  ];
  programs.git.enable = true; 
  programs.git.settings = {
    userName = "Rafael-monteiro-zancanaro";
    userEmail = "rafaelmonte46@gmail.com";
  };
}


