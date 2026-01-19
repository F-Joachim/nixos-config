{ pkgs, ... }:
{
  programs.plasma = {
    enable = true;
    workspace = {
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/ColdRipple/";
    };
    kscreenlocker = {
      appearance = {
        wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/ColdRipple/";
      };
    };
    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        floating = true;
        widgets = [
          # First spacer to center the task manager icons
          "org.kde.plasma.panelspacer"

          # Configure the widgets by adding the widget-specific options for it.
          # See modules/widgets for supported widgets and options for these widgets.
          # For example:
          {
            kickoff = {
              sortAlphabetically = true;
              icon = "nix-snowflake";
            };
          }

          # Adding configuration to the widgets can also for example be used to
          # pin apps to the task-manager, which this example illustrates by
          # pinning dolphin and konsole to the task-manager by default with widget-specific options.
          {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:org.kde.kate.desktop"
                "applications:code.desktop"
                "applications:firefox.desktop"
              ];
              behavior = {
                grouping.method = "none";
              };
            };
          }

          # Second spacer to center the task manager icons
          "org.kde.plasma.panelspacer"

          {
            systemTray.items = {
              # We explicitly show bluetooth and battery
              shown = [
                "org.kde.plasma.battery"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
              ];
            };
          }
          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "24h";
            };
          }
        ];
      }
    ];
  };
}
