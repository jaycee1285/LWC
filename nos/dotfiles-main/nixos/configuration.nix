# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Enable home manager
      <home-manager/nixos>

      # Custom modules
      ./system/boot.nix
      ./system/network.nix
      ./system/programs.nix
      ./system/services.nix
      ./system/labwc.nix
    ];

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  };

  users = {
    defaultUserShell = pkgs.zsh;  

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.john = {
      isNormalUser = true;
      description = "john";
      password = "Sienna99";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
  
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.john = import ./john.nix;
  };
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Garbage collection
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
    dates = "weekly";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bash
    greetd.tuigreet
    pavucontrol
    playerctl
    slurp
    wget
    zlib
    bun
  ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    font-awesome
    inconsolata
    iosevka-bin
  ];

  # Env settings
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "nordic";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
