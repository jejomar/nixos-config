{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    waypaper # GUI wallpaper setter
    swww # Wallpaper daemon for waypaper
    grim # Grab images from a Wayland compositor
    slurp # Select a region in a Wayland compositor
    swappy # Screenshot editing tool
    wl-clipboard # Copy/pase utilities for Wayland
  ];
}
