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

  home.file.".config/Code/User/settings.json".source = ../../dotfiles/vscode/settings.json;
}
