{ config, pkgs, ... }:
{
  imports = [
    ./aliases.nix
  ];
  programs.git.enable = true; 
  programs.git.settings.user = {
    name = "Rafael-monteiro-zancanaro";
    email = "rafaelmonte46@gmail.com";
  };
}


