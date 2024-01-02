{ config, pkgs, ... }:
let 
  aagl-gtk-on-nix = import (builtins.fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "03886qinxkvjwhasai2xp1xx3yj7621shwdjsgfzbknqfg0iv0qy";
  });
in
{
  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Heroic Game Launcher
  environment.systemPackages = with pkgs; [
    # Heroic Game Launcher
    heroic
    
    # Wine
    wineWowPackages.stable
    wineWowPackages.staging
    winetricks
  ];

}
