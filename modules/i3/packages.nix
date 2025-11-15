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
    pcmanfm
    
    # Ranger enhancements
    w3m
    highlight
    poppler_utils
    mediainfo
    ffmpegthumbnailer
    unzip
    atool
    bat
    imagemagick
  ];
  
  services.picom = {
    enable = true;
    fade = true;
    inactiveOpacity = 0.9;
    shadow = true;
    fadeDelta = 5;
  };
  
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
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
}