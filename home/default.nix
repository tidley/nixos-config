{ pkgs, ... }:

{
  home.username = "tom";
  home.homeDirectory = "/home/tom";
  home.stateVersion = "26.05";

  imports = [
    ./gnome.nix
  ];
}
