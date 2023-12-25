{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../system/filemgmt.nix # File manager and file system support
      ../../system/gaming.nix
      ../../system/gpu.nix # Extend graphical functionalities
    ];

  ###################
  ### Bootloader  ###
  ###################
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
  };

  ##################
  ### █▄░█ █ ▀▄▀ ###
  ### █░▀█ █ █░█ ###
  ##################

  nix = {

    # Enable Flakes support
    settings.experimental-features = [ "nix-command" "flakes"];

    # Auto optimize the store
    optimise.automatic = true;

    # Garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };


  ################################################# 
  ### █▄░█ █▀▀ ▀█▀ █░█░█ █▀█ █▀█ █▄▀ █ █▄░█ █▀▀ ###
  ### █░▀█ ██▄ ░█░ ▀▄▀▄▀ █▄█ █▀▄ █░█ █ █░▀█ █▄█ ###
  ################################################# 
  networking = {
    hostName = "rosy";

    # Enable wireless support
    networkmanager.enable = true;
  };

  #################
  ### Time Zone ###
  #################
  time.timeZone = "Asia/Manila";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager = {
    sddm = {
      enable = true;
      theme = "${import ../../theming/sddm.nix { inherit pkgs; }}";
    };
  };

  ################
  ### Hyprland ###
  ################
  programs.hyprland = {
    enable = true;

    # Enable XWayland support
    xwayland.enable = true;
  };

  #############
  ## Waybar ###
  #############
  programs.waybar.enable = true;

  #############################
  ### Environment Variables ###
  #############################

  # Enable Wayland support for Electron applications
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  ################
  ### PipeWire ###
  ################
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  #################
  ### Bluetooth ###
  #################
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; # Powers up the default Bluetooth controller on boot
  };
  services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jejomar = {
    isNormalUser = true;
    description = "Jejomar Cariaga";
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      firefox
      git
      rofi-wayland
      xdg-desktop-portal-hyprland
      pavucontrol
      xdg-user-dirs
      networkmanagerapplet
      mpv
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    kitty
    bat

    # Needed for SDDM theming
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qtgraphicaleffects
  ];

  #######################
  ### Unfree Software ###
  #######################
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);

  #############
  ### Fonts ###
  #############
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    ibm-plex

    # Install specific fonts from Nerd Fonts
    (
      nerdfonts.override {
        fonts = [
          "IBMPlexMono"
        ];
      }
    )
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  #####################################
  ### Enable SSH for source control ###
  #####################################
  services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "23.11";
}
