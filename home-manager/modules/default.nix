{pkgs, ...}: {
  imports = [
    ./bat
    ./bottom
    ./direnv
    ./fzf
    ./gh
    ./ghq
    ./git
    ./imagemagick
    ./neovim
    ./nodejs
    ./starship
    ./vim
    ./zellij
    ./zsh
  ];
  home.packages = with pkgs; [
    binutils
    delta
    du-dust
    fd
    git-crypt
    grpcurl
    hexyl
    httpie
    hyperfine
    imagemagick
    jq
    procs
    pueue
    ripgrep
    satysfi
    yq
  ];
}