{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # ... other packages ...
    
    # File management
    ranger
    pcmanfm  # GUI fallback
    
    # Ranger enhancements
    w3m
    highlight
    poppler_utils
    mediainfo
    ffmpegthumbnailer  # Video thumbnails
    unzip  # Archive preview
    atool  # Archive handling
  ];

  # Ranger configuration
  programs.ranger = {
    enable = true;
    
    # Optional: configure ranger
    settings = {
      preview_images = true;
      show_hidden = true;
    };
    
    # Keybindings customization
    keybindings = {
      "gh" = "cd ~";
      "gr" = "cd /";
    };
    
    # Plugins
    plugins = [
      # You can add ranger plugins here
      # "rc.conf"  # Example plugin file
    ];
  };
}