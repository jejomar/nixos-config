{ config, pkgs, ...}:

{
  programs.kitty = {
    enable = true;
    theme = "Gruvbox Dark Hard";
    settings = {
        font_family = "Blex Mono Nerd Font Mono";
        background_opacity = "0.80";
        window_padding_width = 4;
        enable_audio_bell = "no";
        confirm_os_window_close = -1;
    };
  };
}
