{ config, pkgs, ... }:
let
  myAliases = {
    # Core tools
    ll = "ls -l --color=auto";
    la = "ls -la --color=auto";
    grep = "grep --color=auto";
    nv = "nvim";

    # Git shortcuts
    gs = "git status";
    ga = "git add .";
    gc = "git commit";
    gp = "git push origin main";

    # Config files
    hl = "nvim $HOME/.config/hypr/hyprland.conf";

    # Easy navigation
    nx = "cd $HOME/Repositories/nixos-config";

    # NixOS things
    nxrb = "sudo nixos-rebuild switch --flake $HOME/Repositories/nixos-config";
    hmrb = "home-manager switch --flake $HOME/Repositories/nixos-config";
  };
in 
{
  # Bash
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
    historyControl = [
      "erasedups"
      "ignorespace"
      "ignoredups"
    ];
    historyFileSize = 2147483647;
    historySize = 2147483647;
  };

}
