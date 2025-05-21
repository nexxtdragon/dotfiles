# used dconf2nix to generate the gnome config part - https://github.com/gvolpe/dconf2nix, honestly idk if it works but i hope it does
{ config, pkgs, lib, ... }:

with lib.hm.gvariant;

{

  home.username = "nextdragon";
  home.homeDirectory = "/home/nextdragon";

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    kitty
    cava
    firefox
    neofetch
    rofi
  ];

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.oh-my-zsh/custom";
      theme = "";
      plugins = ["git"];
    };
    initExtra = ''
      export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
      export PATH=$PATH:$HOME/.spicetify

      autoload -U colors && colors
      PROMPT="%F{231}╭─ %F{63}%n@%m%f\n%F{231}╰─> %F{63}%~%f "
      RPROMPT=""

      autoload -U compinit && compinit

      zstyle ':completion:*' completer _complete _ignored _commands
      zstyle ':completion:*' menu select

      alias ls='ls --color=auto'
      alias grep='grep --color=auto'

      neofetch
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox-devedition";
    TERMINAL = "kitty";
  };

  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrains Mono";
      font_size = "12";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      background_opacity = "0.7";
      dynamic_background_opacity = "1";
      confirm_os_window_close = "0";

      cursor_trail = "1";

      linux_display_server = "auto";

      scrollback_lines = "2000";
      wheel_scroll_min_lines = "1";

      enable_audio_bell = "no";

      window_padding_width = "4";

      selection_foreground = "none";
      selection_background = "none";

      foreground = "#dddddd";
      background = "#000000";
      cursor = "#dddddd";
    };
    extraConfig = ''
      symbol_map U+23FB-U+23FE,U+2B58,U+E200-U+E2A9,U+E0A0-U+E0A3,U+E0B0-U+E0BF,U+E0C0-U+E0C8,U+E0CC-U+E0CF,U+E0D0-U+E0D2,U+E0D4,U+E700-U+E7C5,U+F000-U+F2E0,U+2665,U+26A1,U+F400-U+F4A8,U+F67C,U+E000-U+E00A,U+F300-U+F313,U+E5FA-U+E62B Symbols Nerd Font
    '';
  };

  dconf.settings = {
    "com/mattjakeman/ExtensionManager" = {
      is-maximized = false;
      last-used-version = "0.5.1";
    };

    "org/gnome/control-center" = {
      last-panel = "mouse";
      window-state = mkTuple [ 980 640 false ];
    };

    "org/gnome/desktop/a11y/applications" = {
      screen-reader-enabled = false;
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" "Pardus" ];
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "org.freedesktop.GnomeAbrt.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.font-viewer.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "wallpaper";
      picture-uri = "file:///home/nextdragon/.local/share/backgrounds/2025-05-20-17-23-48-46.png";
      picture-uri-dark = "file:///home/nextdragon/.local/share/backgrounds/2025-05-20-17-23-48-46.png";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      mru-sources = [ (mkTuple [ "xkb" "us" ]) ];
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "ru" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      accent-color = "teal";
      color-scheme = "prefer-dark";
      cursor-size = 24;
      cursor-theme = "Nordic-cursors";
      document-font-name = "JetBrains Mono NL Semi-Bold 11";
      enable-animations = true;
      font-antialiasing = "grayscale";
      font-name = "JetBrains Mono NL Semi-Bold 10";
      gtk-enable-primary-paste = false;
      icon-theme = "Tela-circle-dark";
      monospace-font-name = "JetBrains Mono NL 10";
      scaling-factor = mkUint32 1;
      show-battery-percentage = false;
      text-scaling-factor = 1.0;
      toolbar-style = "text";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-settings" "com-spotify-client" "amneziavpn" "gnome-power-panel" "org-telegram-desktop" ];
    };

    "org/gnome/desktop/notifications/application/amneziavpn" = {
      application-id = "AmneziaVPN.desktop";
    };

    "org/gnome/desktop/notifications/application/com-spotify-client" = {
      application-id = "com.spotify.Client.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/org-telegram-desktop" = {
      application-id = "org.telegram.desktop.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "areas";
      disable-while-typing = false;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/nextdragon/.local/share/backgrounds/2025-05-20-17-23-48-46.png";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/desktop/sound" = {
      theme-name = "ocean";
    };

    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      action-double-click-titlebar = "toggle-maximize";
      action-middle-click-titlebar = "none";
      action-right-click-titlebar = "menu";
      button-layout = "icon:minimize,close";
      focus-mode = "click";
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/gnome-system-monitor" = {
      current-tab = "resources";
      graph-update-interval = 50;
      process-memory-in-iec = true;
      show-dependencies = false;
      show-whose-processes = "user";
    };

    "org/gnome/gnome-system-monitor/proctree" = {
      col-2-visible = true;
      col-2-width = 0;
      col-26-visible = false;
      col-26-width = 0;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = false;
      center-new-windows = true;
      dynamic-workspaces = true;
      edge-tiling = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
      initial-size-file-chooser = mkTuple [ 1269 827 ];
    };

    "org/gnome/portal/filechooser/org/gnome/Settings" = {
      last-folder-path = "/home/nextdragon/MyWalls/Nord";
    };

    "org/gnome/portal/filechooser/vesktop" = {
      last-folder-path = "/home/nextdragon/Downloads";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Alt>space";
      command = "rofi -show run";
      name = "rofi (alt+space)";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
    };

    "org/gnome/shell" = {
      disabled-extensions = [ "apps-menu@gnome-shell-extensions.gcampax.github.com" "drive-menu@gnome-shell-extensions.gcampax.github.com" "windowsNavigator@gnome-shell-extensions.gcampax.github.com" "window-list@gnome-shell-extensions.gcampax.github.com" "light-style@gnome-shell-extensions.gcampax.github.com" "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" "floatingDock@sun.wxg@gmail.com" "ddterm@amezin.github.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "System_Monitor@bghome.gmail.com" "vuemeter-system@aldunelabs.com" "system-monitor-next@paradoxxx.zero.gmail.com" "status-icons@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" "blur-my-shell@aunetx" "dash-to-dock@micxgx.gmail.com" "lockscreen-extension@pratap.fastmail.fm" "compiz-windows-effect@hermes83.github.com" "logomenu@aryan_k" "mprisLabel@moon-0xff.github.com" "system-monitor@gnome-shell-extensions.gcampax.github.com" ];
      favorite-apps = [ "code.desktop" "firefox.desktop" "firefox-devedition.desktop" "org.gnome.Nautilus.desktop" "kitty.desktop" "com.spotify.Client.desktop" "vesktop.desktop" "org.telegram.desktop.desktop" "steam.desktop" "com.obsproject.Studio.desktop" "AmneziaVPN.desktop" "virtualbox.desktop" "org.vinegarhq.Sober.desktop" ];
      last-selected-power-profile = "performance";
      welcome-dialog-last-shown-version = "47.2";
    };

    "org/gnome/shell/extensions/Logo-menu" = {
      hide-forcequit = true;
      hide-icon-shadow = true;
      hide-softwarecentre = true;
      menu-button-icon-image = 23;
      menu-button-icon-size = 19;
      menu-button-terminal = "kitty";
      show-activities-button = true;
      show-lockscreen = false;
      show-power-options = true;
      symbolic-icon = true;
      use-custom-icon = false;
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      settings-version = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      brightness = 0.6;
      sigma = 30;
      static-blur = true;
      style-dash-to-dock = 0;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/com/github/hermes83/compiz-windows-effect" = {
      friction = 4.8;
      mass = 80.0;
      maximize-effect = false;
      resize-effect = true;
      speedup-factor-divider = 8.7;
      spring-k = 6.2;
      x-tiles = 16.0;
      y-tiles = 4.0;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      always-center-icons = true;
      apply-custom-theme = false;
      background-opacity = 0.2;
      custom-background-color = false;
      custom-theme-shrink = false;
      dance-urgent-applications = true;
      dash-max-icon-size = 52;
      dock-fixed = false;
      dock-position = "BOTTOM";
      extend-height = false;
      height-fraction = 0.9;
      hide-tooltip = false;
      icon-size-fixed = true;
      isolate-monitors = false;
      isolate-workspaces = false;
      multi-monitor = true;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "eDP-1";
      preview-size-scale = 0.1;
      running-indicator-style = "DOTS";
      scroll-action = "do-nothing";
      show-apps-always-in-the-edge = true;
      show-apps-at-top = true;
      show-icons-emblems = true;
      show-mounts = false;
      show-mounts-only-mounted = false;
      show-show-apps-button = false;
      show-trash = false;
      transparency-mode = "FIXED";
      workspace-agnostic-urgent-windows = true;
    };

    "org/gnome/shell/extensions/floatingDock" = {
      floating-dock-position = [ 30 30 ];
    };

    "org/gnome/shell/extensions/lockscreen-extension" = {
      background-image-path-1 = "file:///home/nextdragon/.local/share/backgrounds/2025-05-20-17-23-21-a_graveyard_with_a_castle_and_trees.png";
      background-size-1 = "center";
      blur-radius-1 = 6;
      gradient-direction-1 = "none";
      primary-color-1 = "#000000000000";
      secondary-color-1 = "#000000000000";
      user-background-1 = false;
    };

    "org/gnome/shell/extensions/mpris-label" = {
      album-size = 70;
      auto-switch-to-most-recent = false;
      button-placeholder = "";
      divider-string = " - ";
      extension-place = "left";
      icon-padding = 2;
      last-field = "";
      left-padding = 0;
      remove-text-when-paused = false;
      second-field = "xesam:title";
      show-icon = "left";
      symbolic-source-icon = false;
      use-album = true;
    };

    "org/gnome/shell/extensions/system-monitor-next-applet" = {
      background = "#ffffff16";
      battery-batt0-color = "#f2002e";
      battery-display = false;
      battery-graph-width = 100;
      battery-hidesystem = false;
      battery-position = 9;
      battery-refresh-time = 5000;
      battery-show-menu = false;
      battery-show-text = true;
      battery-style = "digit";
      battery-time = false;
      center-display = false;
      compact-display = false;
      cpu-display = true;
      cpu-graph-width = 100;
      cpu-individual-cores = false;
      cpu-iowait-color = "#002f3d";
      cpu-nice-color = "#00a3ff";
      cpu-other-color = "#001d26";
      cpu-position = 0;
      cpu-refresh-time = 1500;
      cpu-show-menu = true;
      cpu-show-text = true;
      cpu-style = "graph";
      cpu-system-color = "#0092e6";
      cpu-user-color = "#0072b3";
      disk-display = false;
      disk-graph-width = 100;
      disk-position = 5;
      disk-read-color = "#c65000";
      disk-refresh-time = 2000;
      disk-show-menu = true;
      disk-show-text = true;
      disk-style = "graph";
      disk-usage-style = "pie";
      disk-write-color = "#ff6700";
      fan-display = false;
      fan-fan0-color = "#f2002e";
      fan-graph-width = 100;
      fan-position = 8;
      fan-refresh-time = 5000;
      fan-sensor-label = "";
      fan-show-menu = true;
      fan-show-text = true;
      fan-style = "graph";
      freq-display = false;
      freq-freq-color = "#001d26";
      freq-graph-width = 100;
      freq-position = 1;
      freq-refresh-time = 1500;
      freq-show-menu = false;
      freq-show-text = false;
      freq-style = "graph";
      gpu-display = false;
      gpu-graph-width = 100;
      gpu-memory-color = "#00ff82";
      gpu-position = 6;
      gpu-refresh-time = 5000;
      gpu-show-menu = false;
      gpu-show-text = true;
      gpu-style = "graph";
      gpu-used-color = "#00b35b";
      icon-display = true;
      memory-buffer-color = "#00ff82";
      memory-cache-color = "#aaf5d0";
      memory-display = true;
      memory-graph-width = 100;
      memory-position = 2;
      memory-program-color = "#00b35b";
      memory-refresh-time = 5000;
      memory-show-menu = true;
      memory-show-text = true;
      memory-style = "graph";
      move-clock = false;
      net-collisions-color = "#ff0000";
      net-display = true;
      net-down-color = "#fce94f";
      net-downerrors-color = "#ff6e00";
      net-graph-width = 100;
      net-position = 4;
      net-refresh-time = 1000;
      net-show-menu = true;
      net-show-text = true;
      net-speed-in-bits = false;
      net-style = "graph";
      net-up-color = "#fb74fb";
      net-uperrors-color = "#e0006e";
      rotate-labels = false;
      settings-schema-version = 1;
      show-tooltip = false;
      swap-display = false;
      swap-graph-width = 100;
      swap-position = 3;
      swap-refresh-time = 5000;
      swap-show-menu = true;
      swap-show-text = true;
      swap-style = "graph";
      swap-used-color = "#8b00c3";
      thermal-display = false;
      thermal-fahrenheit-unit = false;
      thermal-graph-width = 100;
      thermal-position = 7;
      thermal-refresh-time = 5000;
      thermal-sensor-label = "";
      thermal-show-menu = true;
      thermal-show-text = true;
      thermal-style = "graph";
      thermal-threshold = 0;
      thermal-tz0-color = "#f2002e";
      tooltip-delay-ms = 0;
    };

    "org/gnome/shell/extensions/system-monitor" = {
      show-download = false;
      show-upload = false;
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1747765910;
      first-run = false;
      flatpak-purge-timestamp = mkInt64 1747785967;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 350;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 222 30 ];
      window-size = mkTuple [ 1124 822 ];
    };

  };
}
