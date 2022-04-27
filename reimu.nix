{ config, pkgs, ... }:
{
  home.homeDirectory = builtins.getEnv "HOME";
  home.username = builtins.getEnv "USER";

  home.stateVersion = "22.05";

  nixpkgs.overlays = [
    (
      let rev = "688e5927e149f07c4f909c51716093aff9f21759"; in
      import "${builtins.fetchTarball "https://github.com/nix-community/nixpkgs-wayland/archive/${rev}.tar.gz" }/overlay.nix"
    )
  ];

  imports = [
    ./1password
    ./alacritty
    ./fonts
    ./gammastep
    ./gitkraken
    ./gtk
    ./home-manager
    ./miscellaneous
    ./pcmanfm
    ./ristretto
    ./spotify
    ./zellij

    ./sway/mako.nix
    ./sway/kanshi.nix
    ./sway/waybar.nix
    ./sway/wofi.nix

    ./zsh/starship.nix
  ];

  home.packages = with pkgs; [
    lshw

    traceroute
    tcpdump
    lsof
    nmap
    findomain
    websocat
    wireguard-tools

    # shell play
    pipes-rs
    cbonsai
    cava # audio visualizer for console
    tty-clock

    noisetorch

    networkmanager
    networkmanagerapplet

    pavucontrol

    act # GitHub Actions Runner 
    dive # docker image tool 
    buf # Protobuf tool
    grpcurl # curl for gRPC 
    altair # GraphQL GUI 
    hadolint # linter for Dockerfile
    treefmt
    rustup

    imagemagick

    playerctl
  ];
}