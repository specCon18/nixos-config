{ pkgs, config, lib, ...}:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      main_bar = {
        layer = "top";
        modules-left = [
          "cpu"
          "memory"
          "tray"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "backlight"
          "custom/pw-volume"
          "battery"
        ];
        
        "custom/pipewire" = {
          "exec" = "pw-volume status";
          "return-type" = "json";
          "interval" = "once";
          "signal" = 8;
          "format" = "{icon} {percentage}";
          "format-icons" = {
            "mute" = "";
            "default" = [
              ""
              ""
              ""
            ];
          };
        };
        "network" = {
          "tooltip" = false;
          "format-wifi" = "  {essid}";
          "format-ethernet" = "";
        };
        "backlight" = {
          "tooltip" = false;
          "format" = " {}%";
          "interval" = 1;
          "on-scroll-up" = "light -A 5";
          "on-scroll-down" = "light -U 5";
        };
        "battery" = {
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 20;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{time} {icon}";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "tray" = {
          "icon-size" = 18;
          "spacing" = 10;
        };
        "clock" = {
          "format" = "{: %I:%M %p   %d/%m/%Y}";
        };
        "cpu" = {
          "interval" = 15;
          "format" = " {}%";
          "max-length" = 10;
        };
        "memory" = {
          "interval" = 30;
          "format" = " {}%";
          "max-length" = 10;
        };
      };     
    };
    style = ''
      * {
    	  border: none;
    	  border-radius: 10;
        font-family: "JetbrainsMono Nerd Font" ;
    	  font-size: 15px;
    	  min-height: 10px;
      }

      window#waybar {
      	background: transparent;
      }

      window#waybar.hidden {
      	opacity: 0.2;
      }

      #window {
      	margin-top: 6px;
      	padding-left: 10px;
      	padding-right: 10px;
      	border-radius: 10px;
      	transition: none;
        color: transparent;
      	background: transparent;
      }

      #network {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: #161320;
      	background: #bd93f9;
      }

      #battery {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: #161320;
      	background: #B5E8E0;
      }

      #battery.charging, #battery.plugged {
        color: #161320;
        background-color: #B5E8E0;
      }

      #battery.critical:not(.charging) {
        background-color: #B5E8E0;
        color: #161320;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      @keyframes blink {
          to {
              background-color: #BF616A;
              color: #B5E8E0;
          }
      }

      #backlight {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: #161320;
      	background: #F8BD96;
      }

      #clock {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: #161320;
      	background: #ABE9B3;
      	/*background: #1A1826;*/
      }

      #memory {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	margin-bottom: 0px;
      	padding-right: 10px;
      	border-radius: 10px;
      	transition: none;
      	color: #161320;
      	background: #DDB6F2;
      }
      
      #cpu {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	margin-bottom: 0px;
      	padding-right: 10px;
      	border-radius: 10px;
      	transition: none;
      	color: #161320;
      	background: #96CDFB;
      }

      #tray {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	margin-bottom: 0px;
      	padding-right: 10px;
      	border-radius: 10px;
      	transition: none;
      	color: #B5E8E0;
      	background: #161320;
      }
    '';
  };
}