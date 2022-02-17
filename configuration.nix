# Ednix-env -iA nixos.fishPlugins.fzf-fishit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
     ./hardware-configuration.nix
    ];
  
  environment.variables = {
    SUDO_EDITOR = "nvim";
  };

# Use the GRUB 2 boot loader.
  #boot.loader.grub.enable = true;
  #boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  #boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only


  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub = {
    devices = [ "nodev" ];
    efiSupport = false;
    enable = true;
    useOSProber = true;
    default = "saved";
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
   time.timeZone = "America/Argentina/Salta";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_AR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "es";
  };

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  
  # BSPWM
  services.xserver.windowManager.bspwm.enable = true;
 
  #zsh
  #programs.zsh.enable = true;
  nixpkgs.config.allowUnfree = true;
  # Configure keymap in X11
  services.xserver.layout = "es";
  services.xserver.xkbOptions = "eurosign:e";
  # Picom Fork
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  #sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
   
  # Fonts
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
  ];


  # Virtual Manager - Qemu
  virtualisation.libvirtd = {
    allowedBridges = [
      "nm-bridge"
      "virbr0"
    ];
    enable = true;
    qemu.runAsRoot = false;
  };
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];

  # Enable Docker
  virtualisation.docker.enable = true;

  programs.fish.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.daniel = {
     isNormalUser = true;
     extraGroups = [ "wheel" "sudo" "video" "docker" "mysql" "networkmanager" "libvirtd" ]; # Enable ‘sudo’ for the user.
   };
   
      users.extraUsers.daniel = {
 
 	shell = pkgs.fish;
 
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
     environment.systemPackages = with pkgs; [
     neovim
     gnumake
     wget
     pfetch
     git
     feh
     sxiv
     #picom
     nur.repos.reedrw.picom-next-ibhagwan
     bspwm
     sxhkd
     alacritty
     fish
     polybar
     rofi
     pipes
     ranger
     discord
     pavucontrol
     maim
     killall
     google-chrome
     xclip
     tdesktop
     ffmpeg
     mpv
     gimp
     gnome-breeze
     lxappearance
     kdenlive
     simplescreenrecorder
     youtube-dl
     vscode
     zip
     unzip
     unrar
     which
     ripgrep
     podman
     unrar
     which
     vifm
     nitrogen
     flameshot
     leafpad
     neofetch
     nodejs
     yarn
     fzf
     curl
     xarchiver
     mysql
     apache
     php
     phpmyadmin
     dbeaver
     docker
     docker-compose
     htop
     binutils
     coreutils
     fd
     file
     gnumake
     gnupg
     tmux
     virt-manager
     networkmanagerapplet
   ];
  # Auto upgr
  # ades
  system.autoUpgrade.enable = true;
  # system.autoUpgrade.allowReboot = true;
 
    nix = {
  # Hard link identical files in the store automatically
    autoOptimiseStore = true;
   # automatically trigger garbage collection
    gc.automatic = true;
    gc.dates = "weekly";
    gc.options = "--delete-older-than 30d";
  };
 
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.10"; # Did you read the comment?

}

