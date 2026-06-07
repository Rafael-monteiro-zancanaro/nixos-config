{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  console.keyMap = "br-abnt2";
  services.tailscale.enable = true;

  # =========================
  # Desktop Environment
  # =========================
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  services.xserver = {
    enable = true;
    # Configure keymap in X11
    xkb = {
      layout = "br";
    };

    # NÃO usar driver antigo da Wacom (evita conflito com libinput)
    wacom.enable = false;
  };

  # =========================
  # Input (ESSENCIAL pro tablet)
  # =========================
  services.libinput.enable = true;

  # Evita conflito com driver padrão (recomendado deixar desativado)
  hardware.opentabletdriver.enable = false;

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Firefox
  programs.firefox.enable = true;
  programs.firefox.preferences = {
    "widget.gtk.libadwaita-colors.enabled" = false;
  };

  # User
  users.users.zancanaro = {
    isNormalUser = true;
    description = "Rafael Monteiro Zancanaro";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ git ];
  };

  nixpkgs.config.allowUnfree = true;

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "com.mitchellh.ghostty.desktop" ];
    };
  };

  # =========================
  # System Packages
  # =========================
  environment.systemPackages = with pkgs; [
    vim
    git

    # GNOME Extensions
    gnomeExtensions.paperwm

    # App pra gerenciar extensões
    gnome-extension-manager

    ghostty
    # LazyVim dependencies
    neovim
    curl
    wget
    unzip
    gcc
    ripgrep
    fd
    nodejs
    lua-language-server
    stylua
    nil
    nixd
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-console
  ];

  system.stateVersion = "25.11";
}
