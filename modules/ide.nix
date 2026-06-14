{ home, pkgs, ... }:

{
  home.packages = with pkgs; [
    zed-editor
    codex
  ];
}
