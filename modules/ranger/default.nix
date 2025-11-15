{ config, pkgs, ... }:

{
  programs.ranger = {
    enable = true;
    
    # Main configuration
    settings = {
      # Display settings
      line_numbers = "relative";
      show_hidden = true;
      preview_images = true;
      preview_files = true;
      use_preview_script = true;
      
      # Behavior
      autosave_bookmarks = false;
      automatically_count_files = true;
      open_all_images = true;
      
      # UI
      draw_borders = "both";
      padding_right = true;
    };
    
    # Keybindings (vim-like)
    keybindings = {
      "gh" = "cd ~";
      "gr" = "cd /";
      "gD" = "cd ~/Downloads";
      "gd" = "cd ~/Documents";
      "yy" = "copy";
      "dd" = "cut";
      "pp" = "paste";
      "zh" = "set show_hidden!";
    };
  };
  
  # Ranger preview script
  home.file.".config/ranger/scope.sh".source = let
    scopeScript = pkgs.writeShellScript "ranger-scope.sh" ''
      #!/bin/sh
      set -o pipefail
      case "$1" in
        *.tar*|*.tgz|*.tbz) ${pkgs.atool}/bin/atool -l "$1" ;;
        *.zip) ${pkgs.unzip}/bin/unzip -l "$1" ;;
        *.rar) ${pkgs.unrar}/bin/unrar l "$1" ;;
        *.7z) ${pkgs.p7zip}/bin/7z l "$1" ;;
        *.pdf) ${pkgs.poppler_utils}/bin/pdftotext "$1" - ;;
        *.mp3|*.flac|*.m4a|*.wav) ${pkgs.mediainfo}/bin/mediainfo "$1" ;;
        *.jpg|*.jpeg|*.png|*.gif) 
          ${pkgs.w3m}/bin/w3m -o 'ext_image_format=png' "$1" | 
          ${pkgs.imagemagick}/bin/convert - -resize "800x600>" png:- 
          ;;
        *.mp4|*.avi|*.mkv|*.webm)
          ${pkgs.ffmpegthumbnailer}/bin/ffmpegthumbnailer -i "$1" -o - -s 800 
          ;;
        *) ${pkgs.highlight}/bin/highlight -O ansi "$1" 2>/dev/null || 
           ${pkgs.bat}/bin/bat --color=always --style=numbers "$1" 2>/dev/null ||
           ${pkgs.coreutils}/bin/cat "$1" 
           ;;
      esac
    '';
  in {
    executable = true;
    text = builtins.readFile scopeScript;
  };
}