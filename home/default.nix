{ ... }:

{
  home.username = "tom";
  home.homeDirectory = "/home/tom";
  home.stateVersion = "26.05";

  imports = [
    ./gnome.nix
    ./mime.nix
    ./extensions.nix
    ./bash.nix
    ./git.nix
    ./autostart.nix
  ];
}
