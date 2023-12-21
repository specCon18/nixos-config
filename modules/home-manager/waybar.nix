{ pkgs, config, lib, ...}:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
    settings = {
      main_bar = {
            layer = "top"; 
            position = "top";
            height = 40;
            spacing = 8; 
            modules-left = [
              "battery"
            ];
            modules-center = [
              "temperature"
            ];
            modules-right = [
              "backlight"
              "cpu"
              "memory"
              "pulseaudio"
              "network"
              "clock"
            ];
            keyboard-state = {
                numlock = true;
                capslock = true;
                format = "{name} {icon}";
                format-icons = {
                    locked = "";
                    unlocked = "";
                };
            };
            clock = {
               timezone = "America/Detroit";
               tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
               format-alt = "{:%d-%m-%Y}";
            };
            cpu = {
               format = "{usage}% ";
               tooltip = false;
            };
            memory = {
               format = "{}% ";
            };
            temperature = {
                thermal-zone = 2;
                hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
                critical-threshold = 80;
                format-critical = "{temperatureC}°C {icon}";
                format = "{temperatureC}°C {icon}";
                format-icons = ["" "" ""];
            };
            backlight = {
              format = "{percent} {icon}";
              format-icons = ["" "" "" "" "" "" "" "" ""];
            };
            battery = {
                states = {
                    good = 95;
                    warning = 30;
                    critical = 15;
                };
                format = "{capacity}% {icon}";
                format-charging = "{capacity}% ";
                format-plugged = "{capacity}% ";
                format-alt = "{time} {icon}";
                format-good = "";
                format-full = "";
                format-icons = [
                  ""
                  ""
                  ""
                  ""
                  ""
                ];
            };
            "battery#bat2" = {
                bat = "BAT";
            };
            network = {
                format-wifi = "{essid} ({signalStrength}%) ";
                format-ethernet = "{ipaddr}/{cidr} ";
                tooltip-format = "{ifname} via {gwaddr} ";
                format-linked = "{ifname} (No IP) ";
                format-disconnected = "Disconnected ⚠";
                format-alt = "{ifname}: {ipaddr}/{cidr}";
            };
            pulseaudio = {
                scroll-step = 1;
                format = "{volume}% {icon} {format_source}";
                format-bluetooth = "{volume}% {icon} {format_source}";
                format-bluetooth-muted = "{icon} {format_source}";
                format-muted = " {format_source}";
                format-source = "{volume}% ";
                format-source-muted = "";
                format-icons = {
                    headphone = "";
                    hands-free = "";
                    headset = "";
                    phone = "";
                    portable = "";
                    car = "";
                    default = [
                      ""
                      ""
                      ""
                    ];
                };
                on-click = "pavucontrol";
            };
        };
      };
      style = builtins.readFile ./style.css;
    };
  }