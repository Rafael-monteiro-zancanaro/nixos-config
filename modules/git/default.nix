{ config, pkgs, ... }:
{
  imports = [
    ./aliases.nix
  ];
  programs.git = {
    enable = true;
    userName = "Rafael-monteiro-zancanaro";
    userEmail = "rafaelmonte46@gmail.com";
  };
}


