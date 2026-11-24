{ pkgs, lib, ... }:

{
  hardware.bluetooth.enable = true;
  hardware.enableRedistributableFirmware = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.fwupd.enable = true;
  services.flatpak.enable = true;
  services.avahi.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
    dconf-editor
    yaru-theme
    terminator
    wl-clipboard
    solaar
    gnomeExtensions.dash-to-dock
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.custom-menu-panel
    gnomeExtensions.highlight-focus
    gnomeExtensions.wsp-windows-search-provider
    gnomeExtensions.always-show-titles-in-overview
    gnomeExtensions.vitals
    gnome-shell-extensions
  ];
}
