{ config, pkgs, ...}:

{
  imports = [];

  home.packages = with pkgs; [
    papirus-folders
    lightly-qt
  ];

  # Enable support for qt and gtk
  gtk.enable = true;
  qt.enable = true;

  qt.platformTheme = "qtct";

  # Set cursor theme
  gtk.cursorTheme = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
  };

  # Set icon theme
  gtk.iconTheme = {
    package = pkgs.papirus-icon-theme.override { color = "yaru"; };
    name = "Papirus-Dark";
  };

  # Set gtk theme
  gtk.theme = {
    package = pkgs.gruvbox-gtk-theme;
    name = "Gruvbox Dark Hard";
  };
}
