{ home, pkgs, ... }:

{
  programs.bash.enable = true;
  home.shellAliases = {
    # Lista todas as listas de templates de flake prontos do repo the-nix-way
    flake-templates = "nix flake show github:the-nix-way/dev-templates";
  };

  programs.bash.initExtra = ''
    flake-template() {
      nix flake init -t "github:the-nix-way/dev-templates#$1"
    }
    v() {
      nvim "$@"
    }
    rebuild() {
      sudo nixos-rebuild switch --flake "$@"
    }
    envfor() {
      echo "Generating devenv for $*"
      curl -s -X POST "https://devenv.new/api/generate" \
        -F "q=$*" \
        | jq -r '.devenv_nix'
    }
  '';
}
