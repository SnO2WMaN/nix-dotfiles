{ config, pkgs, ... }:
{
  imports = [
    # "${fetchTarball "https://github.com/mudrii/hmtst/tarball/54387d616d028d5b1883dd5fe9a0d2dd4de20a00"}/services/nixos-vscode-ssh-fix.nix"
    ./alacritty/alacritty.nix
    ./firefox/firefox.nix
    ./git/git.nix
    ./neovim/neovim.nix
    ./sway/sway.nix
    ./vscode/vscode.nix
    ./zsh/zsh.nix
  ];

  home.username = "sno2wman";
  home.homeDirectory = "/home/sno2wman";

  home.stateVersion = "21.05";

  home.language.base = "en_US.UTF-8";
  home.packages = with pkgs; [
    zellij
    nixpkgs-fmt
    nixops
    lshw
    treefmt
    libreoffice
    # desktop manager
    ly
    # sway / desktop
    clipman
    wofi
    mako
    wl-clipboard
    wf-recorder
    waybar
    pavucontrol
    # fonts
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    # fcitx
    # unfree
    _1password-gui
  ];

  fonts.fontconfig.enable = true;

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-configtool
      fcitx5-gtk
      fcitx5-mozc
      libsForQt5.fcitx5-qt
    ];
  };

  programs.home-manager = {
    enable = true;
  };

  programs.fzf.enable = true;
  programs.exa.enable = true;
  programs.bat.enable = true;
  programs.jq.enable = true;
  programs.direnv.enable = true;

  programs.bottom = {
    enable = true;
  };

  programs.starship = {
    enable = true;
  };
  # services.nixos-vscode-ssh-fix.enable = true;
}
