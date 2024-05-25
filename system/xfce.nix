  { config, pkgs, ... }: {
  
  services.xserver.desktopManager = { 
    xfce.enable = true;
    wallpaper.mode = "scale";
  };

  }