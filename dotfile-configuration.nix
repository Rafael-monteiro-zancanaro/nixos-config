{ home, pkgs, ... }:

{
  home.file.".bash_aliases".source = ./dotfiles/bash_aliases;
}
