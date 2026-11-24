{ lib, ... }:

let
  sharedDirs = [
    "Documents"
    "Downloads"
    "Pictures"
    "Music"
    "Videos"
    "Desktop"
    "code"
    "scripts"
    "AppImages"
  ];
in
{
  fileSystems = lib.listToAttrs (map (dir: {
    name = "/home/tom/${dir}";
    value = {
      device = "/mnt/debian-home/tom/${dir}";
      fsType = "none";
      options = [ "bind" ];
      depends = [ "/mnt/debian-home" ];
    };
  }) sharedDirs);
}
