{ config, pkgs, ... }:

{
  programs.ranger = {
    enable = true;
    
    # Configurações que vão para o rc.conf
    extraConfig = ''
      # Custom keybindings
      map gh cd ~
      map gr cd /
      map gD cd ~/Downloads
      map gM cd ~/Documents
      map gC cd ~/.config
      map gP cd ~/projects
      
      # Toggle hidden files
      map zh set show_hidden!
      
      # Better file sorting
      set sort natural
    '';
    
    # Settings que vão para o commands.py
    settings = {
      show_hidden = true;
      preview_images = true;
      use_preview_script = true;
      line_numbers = "relative";
    };
  };
  
  # Script de preview melhorado (isso vai para scope.sh)
  home.file.".config/ranger/scope.sh".source = pkgs.writeShellScript "scope.sh" ''
    #!/bin/sh
    case "$1" in
      *.tar*|*.tgz|*.tbz) ${pkgs.atool}/bin/atool -l "$1" ;;
      *.zip) ${pkgs.unzip}/bin/unzip -l "$1" ;;
      *.rar) ${pkgs.unrar}/bin/unrar l "$1" ;;
      *.7z) ${pkgs.p7zip}/bin/7z l "$1" ;;
      *.pdf) ${pkgs.poppler_utils}/bin/pdftotext "$1" - ;;
      *.mp3|*.flac|*.m4a|*.wav) ${pkgs.mediainfo}/bin/mediainfo "$1" ;;
      *.jpg|*.jpeg|*.png|*.gif)
        ${pkgs.w3m}/bin/w3m -o ext_image_format=png "$1" 2>/dev/null ||
        ${pkgs.imagemagick}/bin/convert - -resize "800x600>" png:-
        ;;
      *.mp4|*.avi|*.mkv|*.webm)
        ${pkgs.ffmpegthumbnailer}/bin/ffmpegthumbnailer -i "$1" -o - -s 800 2>/dev/null
        ;;
      *)
        ${pkgs.bat}/bin/bat --color=always --style=numbers "$1" 2>/dev/null ||
        ${pkgs.highlight}/bin/highlight -O ansi "$1" 2>/dev/null ||
        ${pkgs.coreutils}/bin/cat "$1"
        ;;
    esac
  '';
}