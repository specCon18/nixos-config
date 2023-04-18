{ pkgs, config, lib, ...}:
{
      programs.alacritty = {
      enable = true;
      settings = {
        window = {
          dimensions = {
            columns = 120;
            lines = 25;
          };
          decorations = "none";
          opacity = 0.9;
          title = "Alacritty";
        };
        font = {
          normal = {
            family = "SauceCodePro Nerd Font";
          };
          bold = {
            family = "SauceCodePro Nerd Font";
            style = "bold";
          };
          size = 12;
        };
        colors = {
          primary = {
            background = "#1d1f21";
            foreground = "#c5c8c6";
          };
          cursor = {
            text = "CellBackground";
            cursor = "CellForeground";
          };
            # Normal colors
          normal = {
            black = "#363537";
            red = "#FC618D";
            green = "#7BD88F";
            yellow = "#FCE566";
            blue = "#FD9353";
            magenta = "#948AE3";
            cyan = "#5AD4E6";
            white = "#F7F1FF";
          };

          # Bright colors
          bright = {
            black = "#69676C";
            red = "#FC618D";
            green = "#7BD88F";
            yellow = "#FCE566";
            blue = "#FD9353";
            magenta = "#948AE3";
            cyan = "#5AD4E6";
            white = "#F7F1FF";              
          };
        };
      };
    };
}