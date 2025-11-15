{ config, pkgs, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    
    config = {
      modifier = "Mod4";
      
      keybindings = let
        modifier = config.xsession.windowManager.i3.config.modifier;
      in pkgs.lib.mkOptionDefault {
        # Launch terminal
        "${modifier}+Return" = "exec alacritty";
        
        # Application launcher
        "${modifier}+d" = "exec dmenu_run";
        "${modifier}+Shift+d" = "exec rofi -show run";
        
        # Kill focused window
        "${modifier}+Shift+q" = "kill";
        
        # Window focus
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        
        # Move windows
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";
        
        # Split
        "${modifier}+v" = "split h";
        "${modifier}+g" = "split v";
        
        # Fullscreen
        "${modifier}+f" = "fullscreen toggle";
        
        # Layout
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";
        
        # Workspaces
        "${modifier}+1" = "workspace 1";
        "${modifier}+2" = "workspace 2";
        "${modifier}+3" = "workspace 3";
        "${modifier}+4" = "workspace 4";
        "${modifier}+5" = "workspace 5";
        "${modifier}+6" = "workspace 6";
        "${modifier}+7" = "workspace 7";
        "${modifier}+8" = "workspace 8";
        "${modifier}+9" = "workspace 9";
        "${modifier}+0" = "workspace 10";
        
        # Move containers to workspace
        "${modifier}+Shift+1" = "move container to workspace 1";
        "${modifier}+Shift+2" = "move container to workspace 2";
        "${modifier}+Shift+3" = "move container to workspace 3";
        "${modifier}+Shift+4" = "move container to workspace 4";
        "${modifier}+Shift+5" = "move container to workspace 5";
        "${modifier}+Shift+6" = "move container to workspace 6";
        "${modifier}+Shift+7" = "move container to workspace 7";
        "${modifier}+Shift+8" = "move container to workspace 8";
        "${modifier}+Shift+9" = "move container to workspace 9";
        "${modifier}+Shift+0" = "move container to workspace 10";
        
        # Reload and restart
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+r" = "restart";
        
        # Exit i3
        "${modifier}+Shift+e" = "exec i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'";
      };
      
      # Assign applications to specific workspaces
      assigns = {
        "2" = [{ class = "^Firefox$"; }];
        "3" = [{ class = "^Alacritty$"; }];
        "4" = [{ class = "^Code$"; }]; # VS Code
        "5" = [{ class = "^jetbrains-idea$"; }];
      };
      
      # Bar configuration
      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status}/bin/i3status";
          fonts = {
            names = [ "DejaVu Sans Mono" "FontAwesome" ];
            size = 11.0;
          };
          colors = {
            background = "#2f343f";
            statusline = "#ffffff";
            separator = "#666666";
            focusedWorkspace = {
              background = "#0088cc";
              border = "#0088cc";
              text = "#ffffff";
            };
            activeWorkspace = {
              background = "#2f343f";
              border = "#2f343f";
              text = "#ffffff";
            };
            inactiveWorkspace = {
              background = "#2f343f";
              border = "#2f343f";
              text = "#888888";
            };
          };
        }
      ];
      
      # Colors for window borders
      colors = {
        focused = {
          border = "#0088cc";
          background = "#0088cc";
          text = "#ffffff";
          indicator = "#0088cc";
          childBorder = "#0088cc";
        };
      };
      
      # Font
      fonts = {
        names = [ "DejaVu Sans Mono" "FontAwesome" ];
        size = 11.0;
      };
      
      # Gaps (opcional)
      # gaps.inner = 10;
      # gaps.outer = 5;
    };
    
    # Extra configuration
    extraConfig = ''
      # Gaps configuration (descomente se quiser gaps)
      # gaps inner 10
      # gaps outer 5
      
      # Smart borders
      smart_borders on
      
      # Hide borders
      hide_edge_borders smart
      
      # Focus on window activation
      focus_on_window_activation smart
      
      # Startup applications
      exec --no-startup-id nitrogen --restore
      exec --no-startup-id picom -b
      exec --no-startup-id nm-applet
      exec --no-startup-id blueman-applet
      exec --no-startup-id xss-lock -- i3lock -c 000000
    '';
  };
}
