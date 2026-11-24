{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rpi-imager
    gparted

    # System diagnostics
    file
    lsof
    evtest
    dmidecode
    smartmontools
    mesa-demos
    libva-utils
    lm_sensors
  ];
}
