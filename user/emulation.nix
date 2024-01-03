{ pkgs, ...}:

{
  home.packages = with pkgs; [
    pcsx2
    ppsspp-qt
    citra-canary
    yuzu-ea
  ];
}
