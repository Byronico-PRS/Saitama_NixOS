{ config, pkgs, ... }: {
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  
# Xfce Apps
  pavucontrol #mixer audio program
  xfce.xfce4-pulseaudio-plugin #applet that fits in xfce theme that control pavucontrol
  xfce.catfish
  xfce.xfce4-whiskermenu-plugin 
  xfce.xfce4-clipman-plugin   
  xfce.thunar-archive-plugin  
  xfce.xfce4-genmon-plugin
# lightdm_gtk_greeter    
  gparted
  libsForQt5.breeze-icons
  zafiro-icons
  xarchiver
# terminal apps
  wget
  xz
  gzip
  vim
  htop
  btop
  ffmpeg
  unzip
  p7zip
  maia-icon-theme
  gparted
  libsForQt5.breeze-icons
  zafiro-icons
  libsForQt5.kdeconnect-kde    
  cmatrix
  # libsForQt5.bismuth
  fluidsynth
  alsaTools
  jack2
  cadence
  #  pulseaudioFull
  soundfont-fluid
  soundfont-ydp-grand
# Internet
  firefox #browser
  #brave #browser
  thunderbird #mail-client
# Escritorio
  libreoffice #office suite
  #okular #pdf reade #versao flatpak parece funcionar melhor no awesomewm
  vscodium #text editor
  direnv
  git
  unetbootin #live usb creator
  nextcloud-client #cloud files
  gnome.zenity
  usbutils
# Audio
  musescore #editor de partitura
  reaper #daw essa versao provoca dificuldades de configuração com o reapck e outros plugins do js
  ardour #daw
  helm #synth
  distrho #pugin suite
  drumgizmo #drum sample
  vmpk    #piano
  guitarix # guitar amps
  gxplugins-lv2 #guitar plugin
  calf #plugin suite
  tonelib-metal #guitaramp
# Video
  obs-studio #rec_screen vide_studio
  vlc #video player
  libsForQt5.kdenlive #video editor
  gphoto2 #cam tool
     
  #Windows apps
  wineWowPackages.waylandFull
  winetricks
  carla
  yabridge
  yabridgectl
# Impressora
  gnomeExtensions.alternate-menu-for-hplip2
  hplipWithPlugin
# imagens
  gimp
  inkscape 
#games
  scid         
  ];
  }