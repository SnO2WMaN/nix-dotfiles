{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    curl
  ];
}