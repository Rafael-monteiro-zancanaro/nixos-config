{ config, pkgs, ... }:

{
  home.file.".vimrc".source = ../../dotfiles/vimrc;
}