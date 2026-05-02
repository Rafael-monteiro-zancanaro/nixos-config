{ home, pkgs, ... }:

{
  programs.bash.enable = true;
  home.shellAliases = {
    flake-templates = "nix flake show github:the-nix-way/dev-templates";
    flake-template = "nix flake init -t github:the-nix-way/dev-templates#";
  };
}
