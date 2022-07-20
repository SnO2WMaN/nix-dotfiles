{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bat.nix
    ./bottom.nix
    ./home-manager.nix
    ./binutils.nix
    ./fzf-ghq.nix
    ./fzf.nix
    ./httpie.nix
    ./delta.nix
    ./direnv.nix
    ./du-dust.nix
    ./fd.nix
    ./gh.nix
    ./node.nix
    ./ghq.nix
    ./git.nix
    ./hexyl.nix
    ./hyperfine.nix
    ./imagemagick.nix
    ./jq.nix
    ./lsd.nix
    ./neovim.nix
    ./procs.nix
    ./pueue.nix
    ./ripgrep.nix
    ./satysfi.nix
    ./starship.nix
    ./yq.nix
    ./zellij.nix
    ./zsh.nix
  ];
  home.packages = with pkgs; [
    unzip
    psmisc
    clean-emptydir
    pipr
    tokei
    vagrant
  ];
}
