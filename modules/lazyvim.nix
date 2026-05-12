{home, pkgs, ...}:

{
  home.packages = with pkgs; [
    tree-sitter
    nix-index
  ];
}
