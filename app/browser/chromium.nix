{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    extensions = [
      # uBlock Origin
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }

      # Violent Monkey
      { id = "jinjaccalgkegednnccohejagnlnfdag"; }
    ];
  };
}
