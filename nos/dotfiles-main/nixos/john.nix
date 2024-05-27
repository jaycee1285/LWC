{config, pkgs, lib, ...}:

{
  imports = 
    [
      ./home-manager/alacritty.nix
      ./home-manager/dots.nix
      ./home-manager/git.nix
      ./home-manager/gtk.nix
      ./home-manager/helix.nix
      ./home-manager/kanshi.nix
      ./home-manager/mako.nix
      ./home-manager/waybar.nix
      ./home-manager/zsh.nix
    ];
  
  home.username = "john";
  home.homeDirectory = "/home/john";
  home.stateVersion = "23.11";
  home.sessionVariables.GTK_THEME = "nordic";
  
  home.packages = with pkgs; [
    bemenu
    git
    grim
    labwc-tweaks
    slurp
    swappy
    swww
    wlr-randr
    kitty
    codium
    librewolf
    joplin-desktop
    onedrive
    onedrivegui
    github-desktop
    nordic
    papirus-icon-theme
    kitty-themes
    unzip
    wofi
    nwg-bar
    kvantum
    nwg-look
  ];
}
