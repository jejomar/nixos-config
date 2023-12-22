{ config, pkgs, ... }:
let
  username = "jejomar";
  screenshotDir = "/home/${username}/Pictures/Screenshots/mpv";
in
{
  programs.mpv = {
    enable = true;

    bindings = {
      "Alt+1" = "set current-window-scale 0.75";
      "Alt+2" = "set current-window-scale 1";
    };

    defaultProfiles = [ "gpu-hq" ];

    scripts = with pkgs.mpvScripts; [
      mpris # plugin for mpv which allows control of the player using standard media keys
      autoload # automatically loads playlist entries before and after the currently played file
    ];

    config = {
      # General
      pause = true;
      keep-open = true;
      cursor-autohide = 250;

      # Subtitles
      sub-auto = "fuzzy";
      embeddedfonts = "yes";
      sub-use-margins = true;
      
      sub-font = "IBM Plex Sans";
      sub-font-size = 30;
      sub-color = "'#FFFFFFFF'";
      sub-border-color = "#FF282828";
      sub-border-size = 2;
      sub-shadow-offset = 1;
      sub-shadow-color = "#331D2021";
      sub-spacing = 0.5;
    
      # Language
      slang = "eng, en";
      alang = "jpn, jp, ja, eng, en";

      # Audio
      volume-max = 200;
      volume = 70;

      # OSD
      osd-level = 1;
      osd-font = "BlexMono Nerd Font Mono";
      osd-font-size = 30;
      "no-osd-bar" = "";
      "no-osc" = "";

      # Screenshot
      screenshot-format = "png";
      screenshot-template = "%tY%tm%td_%F(%p)";
      screenshot-directory = "${screenshotDir}";
      screenshot-png-compression = 4;

      # Hardware acceleration
      hwdec = "auto-safe";
      vo = "gpu";
      
      # Wayland
      gpu-context = "wayland";
    };
  };
}
