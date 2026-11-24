{ pkgs, ... }:

{
  xdg.configFile."autostart/megasync.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=MEGAsync
    Exec=${pkgs.megasync}/bin/megasync
    Terminal=false
    X-GNOME-Autostart-enabled=true
  '';
}
