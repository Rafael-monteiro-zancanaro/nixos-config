{ home, pkgs, ... }:

{
  programs.bash.enable = true;
  home.shellAliases = {
    teste = "echo teste testando!!!";
  };
}
