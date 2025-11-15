{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # i3 essentials
    dmenu
    i3status
    i3lock
    
    # Utilities
    feh
    nitrogen
    picom
    rofi
    arandr
    
    # System tray apps
    networkmanagerapplet
    blueman
    
    # File management
    ranger
    pcmanfm  # GUI fallback
    
    # Ranger enhancements
    w3m
    highlight
    poppler_utils
    mediainfo
    ffmpegthumbnailer
    unzip
    atool
    bat  # Better cat for previews
    imagemagick  # For image previews
  ];
  
  # Services
  services = {
    picom = {
      enable = true;
      fade = true;
      inactiveOpacity = 0.9;
      shadow = true;
      fadeDelta = 5;
    };
  };
  
  # Terminal configuration
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.9;
        decorations = "full";
        padding = { x = 5; y = 5; };
      };
      font = {
        size = 11;
        normal = {
          family = "Fira Code";
          style = "Regular";
        };
      };
      colors = {
        primary = {
          background = "#1e1e2e";
          foreground = "#cdd6f4";
        };
      };
    };
  };
  
  # Ranger configuration - FORA do programs.ranger
  # Criamos arquivos de configuração manualmente
  home.file.".config/ranger/rc.conf".text = ''
    # Ranger configuration
    set show_hidden true
    set preview_images true
    set use_preview_script true
    set line_numbers relative
    
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
  
  # Script de preview melhorado
  home.file.".config/ranger/scope.sh".source = let
    scopeScript = pkgs.writeShellScript "ranger-scope.sh" ''
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
  in scopeScript;
}