{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    google-chrome
    thunderbird
    tor-browser
    keepassxc
    filezilla
    vlc
    obs-studio
    ffmpeg
    quodlibet
    picard
    gedit
    libreoffice
    borgbackup
    rsync
    btop
    htop
    neovim
    lazygit
    tmux
    screen
    zip
    unzip
    appimage-run
    distrobox
  ];
}
