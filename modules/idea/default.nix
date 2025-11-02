{ config, pkgs, ... }:

{
  # imports = [
  #   ./ideavim.nix <-- TODO: Criar configuração dotfile para esse cara
  # ];
  home.packages = with pkgs; [
    (jetbrains.plugins.addPlugins jetbrains.idea-community [ "ideavim" ])
  ];
}