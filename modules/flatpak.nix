{ ... }:

{
  services.flatpak = {
    enable = true;

    uninstallUnmanaged = false;

    update.onActivation = false;

    packages = [
      "com.calibre_ebook.calibre"
      "com.discordapp.Discord"
      "com.getpostman.Postman"
      "com.prusa3d.PrusaSlicer"
      "com.rustdesk.RustDesk"
      "com.slack.Slack"
      "io.github.amit9838.mousam"
      "io.github.peazip.PeaZip"
      "it.mijorus.gearlever"
      "md.obsidian.Obsidian"
      "nl.hjdskes.gcolor3"
      "one.flipperzero.qFlipper"
      "org.freecad.FreeCAD"
      "org.gimp.GIMP"
      "org.kde.kweather"
      "org.qbittorrent.qBittorrent"
      "org.signal.Signal"
      "org.sqlitebrowser.sqlitebrowser"
      "us.zoom.Zoom"
    ];
  };
}
