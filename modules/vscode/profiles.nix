{ config, pkgs, lib, ... }:
{
  programs.vscode.profiles = {
    default = {
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        jnoortheen.nix-ide
      ];
    };
    rust = {
      extensions = with pkgs.vscode-extensions; [
        dustypomerleau.rust-syntax
        rust-lang.rust-analyzer
        vadimcn.vscode-lldb
      ];
    };
  };
}
