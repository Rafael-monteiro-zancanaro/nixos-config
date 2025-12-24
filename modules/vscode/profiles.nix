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
        rust-lang.rust-analyzer
        vadimcn.vscode-lldb
      ];
    };
  };
}
