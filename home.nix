{ config, pkgs, ... }:

{
  home.username = "rafaelmz";
  home.homeDirectory = "/home/rafaelmz";
  home.stateVersion = "25.05";
  imports = [
	./modules/misc.nix
	./modules/dev.nix
  ];

  home.packages = with pkgs; [
    xclip
    curl
    htop
    noto-fonts
    noto-fonts-color-emoji
    font-awesome
    cmatrix   
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono  
    nerd-fonts.hack
    bat
    tree
  ];
  
  gtk = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font 12";
      package = pkgs.nerd-fonts.fira-code;
    };
  };

  dconf.settings = {
    "org/cinnamon/desktop/interface" = {
      # Fonte normal para interface
      font-name = "Noto Sans 10";
      # Fonte MONO para terminal e código
      monospace-font-name = "FiraCode Nerd Font Mono 11";
    };
  };

  # Configuração alternativa mais robusta
  home.sessionVariables = {
    # Forçar fontes mono
    TERMINAL_FONT = "FiraCode Nerd Font Mono";
  };

  programs.bash = {
    enable = true;
  };
}
