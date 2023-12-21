{ config, pkgs, lib, ...}:

{
  services.mako = {
    enable = true;

    layer="overlay";
    sort="-time";

    backgroundColor = "#1d2021";
    borderColor = "#ddc7a1";
    borderRadius = 10;
    borderSize = 2;
    defaultTimeout = 3000;

    width = 300;
    height = 100;
    font = "BlexMono Nerd Font Mono 10";
  };
}
