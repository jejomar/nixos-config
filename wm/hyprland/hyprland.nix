{ config, pkgs, ... }:

{
  # Required packages
  home.packages = with pkgs; [
    waypaper # GUI wallpaper setter
    swww # Wallpaper daemon for waypaper
    grim # Grab images from a Wayland compositor
    swappy # Screenshot editing tool
  ];
}
