{ home, pkgs, ... }:

{
  programs.bash.enable = true;
  home.shellAliases = {
    # Lista todas as listas de templates de flake prontos do repo the-nix-way
    flake-templates = "nix flake show github:the-nix-way/dev-templates";
  };

  # Baixa um template de flake específico do repo the-nix-way
  programs.bash.initExtra = ''
    flake-template() {
      nix flake init -t "github:the-nix-way/dev-templates#$1"
    }
  '';
}
