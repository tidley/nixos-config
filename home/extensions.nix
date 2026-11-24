{ ... }:

{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-extension-version-validation = true;
      disable-user-extensions = false;

      enabled-extensions = [
        "Always-Show-Titles-In-Overview@gmail.com"
        "clipboard-indicator@tudmotu.com"
        "custom-menu-panel@AndreaBenini"
        "dash-to-dock@micxgx.gmail.com"
        "highlight-focus@pimsnel.com"
        "system-monitor@gnome-shell-extensions.gcampax.github.com"
        "windows-search-provider@G-dH.github.com"
      ];

      favorite-apps = [
        "firefox.desktop"
        "terminator.desktop"
        "org.gnome.Nautilus.desktop"
        "com.slack.Slack.desktop"
        "ssvnc.desktop"
        "org.keepassxc.KeePassXC.desktop"
        "io.github.quodlibet.QuodLibet.desktop"
        "org.gnome.SystemMonitor.desktop"
        "org.signal.Signal.desktop"
      ];
    };

    "org/gnome/shell/extensions/always-show-titles-in-overview" = {
      always-show-window-closebuttons = true;
      hide-background = true;
      show-app-icon = true;
      window-title-position = "Bottom";
    };

    "org/gnome/shell/extensions/clipboard-indicator" = {
      cache-size = 30;
      disable-down-arrow = false;
      display-mode = 0;
      history-size = 150;
      move-item-first = true;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      always-center-icons = true;
      animation-time = 0.05;
      apply-custom-theme = true;
      autohide-in-fullscreen = false;
      background-opacity = 0.8;
      click-action = "focus-minimize-or-appspread";
      custom-theme-shrink = true;
      dash-max-icon-size = 48;
      disable-overview-on-startup = false;
      dock-fixed = false;
      dock-position = "BOTTOM";
      extend-height = false;
      height-fraction = 0.9;
      hide-delay = 0.6;
      hot-keys = false;
      icon-size-fixed = false;
      intellihide = false;
      intellihide-mode = "ALL_WINDOWS";
      isolate-monitors = false;
      isolate-workspaces = false;
      middle-click-action = "launch";
      multi-monitor = false;
      preferred-monitor = -2;
      pressure-threshold = 80.0;
      preview-size-scale = 0.51;
      require-pressure-to-show = true;
      scroll-action = "cycle-windows";
      shift-click-action = "minimize";
      shift-middle-click-action = "launch";
      shortcut = [ "<Super>q" ];
      shortcut-text = "<Super>q";
      show-apps-always-in-the-edge = true;
      show-apps-at-top = false;
      show-delay = 0.05;
    };

    "org/gnome/shell/extensions/highlight-focus" = {
      border-color = "#62a0ea";
      border-radius = 14;
      border-width = 2;
      hide-delay = 750;
      keybinding-highlight-now = [ "<Super>l" ];
    };

    "org/gnome/shell/extensions/system-monitor" = {
      show-swap = false;
    };
  };
}
