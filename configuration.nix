{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
    sha256 = "00000000000000000000000000"; # dummy hash, error message will show you the actual one, replace it!
  };
in

let
  unstable = import <nixpkgs-unstable> {};
in

{
  imports = [
    ./hardware-configuration.nix
    (import "${home-manager}/nixos")
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account.
  users.users.nextdragon = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "nextdragon";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  home-manager.users.nextdragon = {
    home.stateVersion = "24.05";
  };

  # Install firefox.
  programs.firefox.enable = true;
  
  programs.steam.enable = true;
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;
  
  environment.systemPackages = [
    pkgs.tree
    pkgs.obs-studio
    pkgs.telegram-desktop
    pkgs.steam
    pkgs.vesktop
    pkgs.vlc
    pkgs.rofi
    pkgs.kdenlive
    pkgs.flameshot
    pkgs.unzip
    pkgs.git
    pkgs.wine
    pkgs.htop
    pkgs.btop
    pkgs.vscode
    pkgs.curl
    pkgs.wget
    pkgs.python3
    pkgs.lsof
    pkgs.neovim
    pkgs.vim
    pkgs.gnome-extension-manager
    pkgs.gnome-tweaks
    pkgs.killall
    pkgs.bind  
    pkgs.cava  
    pkgs.file  
    pkgs.flatpak  
    pkgs.gimp  
    pkgs.kitty  
    pkgs.neofetch  
    pkgs.os-prober  
    pkgs.speedtest-cli  
    pkgs.oh-my-zsh 
    unstable.amnezia-vpn
    pkgs.firefox-devedition
    pkgs.home-manager
  ];

  services.xserver.windowManager.i3.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "nextdragon" ];

  systemd.services.amneziaservice = {
    enable = true;
    description = "Amnezia VPN Service";
    serviceConfig.ExecStart = "/run/current-system/sw/bin/AmneziaVPN-service";
    serviceConfig.User = "root";
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    zsh-autoenv.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "npm"
        "history"
        "node"
        "rust"
        "deno"
      ];
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "24.11";
}
