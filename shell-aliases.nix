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

       spin=('|' '/' '-' '\')
       i=0

       {
         curl -s -X POST -G "https://devenv.new/api/generate" \
           --data-urlencode "q=$*" \
           > /tmp/devenv_response.tmp
       } &

       local pid=$!

       while kill -0 $$pid 2>/dev/null; do
         printf "\r[%s] Carregando..." "$${spin[$$i]}"
         i=$$(( (i+1) % 4 ))
         sleep 0.1
       done

       printf "\r\033[K"
       jq -r '.devenv_nix' < /tmp/devenv_response.tmp
       rm /tmp/devenv_response.tmp
     }
  '';
}
