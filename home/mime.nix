{ ... }:

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "audio/mp4" = [ "vlc.desktop" ];
      "video/mp4" = [ "vlc.desktop" ];
      "video/x-matroska" = [ "vlc.desktop" ];
      "video/quicktime" = [ "vlc.desktop" ];
      "text/markdown" = [ "org.gnome.TextEditor.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "application/pdf" = [ "org.gnome.Evince.desktop" ];
    };
  };
}
