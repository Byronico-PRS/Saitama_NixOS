{ config, pkgs, ... }: 
{
  services.xserver.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.luaPackages; [
      luarocks # is the package manager for Lua modules
      luadbi-mysql # Database abstraction layer
     ];
    };

  environment.systemPackages = with pkgs; [
   rofi
   picom
   i3lock-fancy
   xclip
   materia-theme
   papirus-icon-theme
   lxappearance
   xorg.xbacklight
   flameshot
   pnmixer
   networkmanagerapplet
   xfce.xfce4-power-manager
   xfce.xfce4-battery-plugin
   xfce.xfce4-terminal
   roboto
   xfce.thunar
   xfce.xfce4-taskmanager
   nitrogen
   arandr

   ];
}
