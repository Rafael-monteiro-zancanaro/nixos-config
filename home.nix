{ ... }:

{
  home.username = "zancanaro";
  home.homeDirectory = "/home/zancanaro";
  home.stateVersion = "26.05";

  imports = [
    ./modules/core.nix
    ./modules/misc.nix
    ./modules/social.nix
    ./modules/ide.nix
    ./shell-aliases.nix
    ./modules/languages.nix
  ];
}
