{home, pkgs, ...}:

{
  home.pkgs = with pkgs; [
    tree-sitter
  ]
}
