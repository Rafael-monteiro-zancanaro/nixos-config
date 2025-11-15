{ config, pkgs, ... }:

{
  programs.ranger = {
    enable = true;
    
    # Configurações básicas
    settings = {
      show_hidden = true;
      preview_images = true;
      use_preview_script = true;
      line_numbers = "relative";
    };
  };
  
  # Keybindings customizados via arquivo rc.conf
  home.file.".config/ranger/rc.conf".text = ''
    # Custom keybindings
    map gh cd ~
    map gr cd /
    map gD cd ~/Downloads
    map gM cd ~/Documents
    map gC cd ~/.config
    map gP cd ~/projects
    
    # Toggle hidden files
    map zh set show_hidden!
  '';
  
  # Script de preview
  home.file.".config/ranger/scope.sh".source = pkgs.writeShellScript "scope.sh" ''
    #!/bin/sh
    case "$1" in
      *.tar*|*.tgz) ${pkgs.atool}/bin/atool -l "$1" ;;
      *.zip) ${pkgs.unzip}/bin/unzip -l "$1" ;;
      *.pdf) ${pkgs.poppler_utils}/bin/pdftotext "$1" - ;;
      *.jpg|*.jpeg|*.png) ${pkgs.w3m}/bin/w3m -o ext_image_format=png "$1" ;;
      *) ${pkgs.highlight}/bin/highlight -O ansi "$1" 2>/dev/null || cat "$1" ;;
    esac
  '';
}