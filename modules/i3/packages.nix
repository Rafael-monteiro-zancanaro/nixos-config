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
        bold = {
          family = "Fira Code";
          style = "Bold";
        };
        italic = {
          family = "Fira Code";
          style = "Italic";
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
}
