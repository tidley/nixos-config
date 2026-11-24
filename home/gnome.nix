{ lib, ... }:

{
  dconf.enable = true;

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "";
      picture-uri-dark = "";
      primary-color = "#181818";
      secondary-color = "#181818";
      color-shading-type = "solid";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Yaru-olive-dark";
      accent-color = "green";
      clock-show-seconds = true;
      clock-show-weekday = true;
      show-battery-percentage = true;
      enable-hot-corners = false;
      font-antialiasing = "grayscale";
      font-hinting = "full";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      resize-with-right-button = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = lib.hm.gvariant.mkEmptyArray
        lib.hm.gvariant.type.string;

      switch-applications-backward = lib.hm.gvariant.mkEmptyArray
        lib.hm.gvariant.type.string;

      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = 0.51489361702127656;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      volume-step = 2;
    };
  };
}
