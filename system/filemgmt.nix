{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    unzip # utility for archives compressed in zip format
    unrar # utility for rar archives
    p7zip # support for 7z archives
    xarchiver # gtk archive manager
  ];

   
  programs.thunar = {
    enable = true;

    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  boot.supportedFilesystems = [ "ntfs" ]; # Enable NTFS support at boot
}
