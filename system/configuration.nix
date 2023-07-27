# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =[
   # Include the results of the hardware scan.
   ./hardware-configuration.nix
   # List of my Packages
    ./pkgs.nix
   # My config audio file     
    ./audio.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "paulo_dell"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  
  # Enable flatpak
  xdg.portal.enable = true;
  services.flatpak.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm = {
    enable = true;
    background = "/home/emmp/Imagens/punch_bgs/saitama_paint.jpg";
    greeters.gtk = {
      enable = true;
      iconTheme.package = pkgs.maia-icon-theme;
      iconTheme.name = "Maia-dark"; 
      theme.package = pkgs.zuki-themes;
      theme.name = "Zukitwo-dark";
      extraConfig = "user-background = false";
    };
  };

  services.xserver.desktopManager = { 
    xfce.enable = true;
    wallpaper.mode = "scale";
  };
  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    defaultShared = true;
    browsing = true;
  };
  # Enable browse print
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  programs.system-config-printer.enable = true;

  # Enable ntfs file system (to open pen drives in ntfs)
  boot.supportedFilesystems = [ "ntfs" ];

 
  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
    
  users.users.emmp = {
    isNormalUser = true;
    description = "emmp";
    homeMode = "755";
    extraGroups = [ "networkmanager" "wheel" "audio" "jackaudio" ];
    packages = with pkgs; [
     #games
     scid #chessdatabase
     ltris #tetris
     abuse #sidescroller action game
     xonotic #multiplayer fps
     stockfish #chess engine   
    ]; 
  };
  
  # Enable xconf.settings in home-manager, to set the xfce desktop
  programs.xfconf.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Make some extra kernel modules available to NixOS (configuracao para camera DSRL, importante q tenho ffmpg já instalado)
  boot.extraModulePackages = with config.boot.kernelPackages;
   [ v4l2loopback.out ];

  # Activate kernel modules (choose from built-ins and extra ones)
  boot.kernelModules = [
    # Virtual Camera
    "v4l2loopback"
  ];

  # Set initial kernel module settings
  boot.extraModprobeConfig = ''
    # exclusive_caps: Skype, Zoom, Teams etc. will only show device when actually streaming
    # card_label: Name of virtual camera, how it'll show up in Skype, Zoom, Teams
    # https://github.com/umlaeute/v4l2loopback
    options v4l2loopback exclusive_caps=1 max_buffers=2 card_label="Canon"
  '';

  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
  system.stateVersion = "23.05"; # Did you read the comment?

}
