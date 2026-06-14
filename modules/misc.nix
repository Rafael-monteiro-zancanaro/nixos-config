{ pkgs, ... }:
{
  # Miscellaneous packages
  home.packages = with pkgs; [
    spotify
    todoist-electron
    obs-studio
    krita
    apostrophe
    pcsx2
  ];
}
