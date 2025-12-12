{ config, pkgs, ... }:

{
  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/terminal" = "kitty.desktop";
    "application/x-terminal-emulator" = "kitty.desktop";
  };

  dconf.settings = {
    "org.gnome.desktop.default-applications.terminal" = {
      exec = "kitty";
      exec-arg = "-e";
    };
  };
}