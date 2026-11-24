{ pkgs, ... }:

{
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.tom.extraGroups = [
    "docker"
    "libvirtd"
    "kvm"
  ];
}
