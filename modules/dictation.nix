{ pkgs, ... }:

{
  imports = [ ./phonon/nix/module.nix ];

  services.phonon-dictation = {
    enable = true;
    user = "tom";
    shellFile = "/etc/nixos/modules/phonon/nix/shell.nix";
    venv = "/home/tom/.local/share/venvs/phonon-nix";
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    uv
    portaudio
    pulseaudio
  ];
}
