{ pkgs, config, lib, ...}:
{
      programs.helix = {
      enable = true;
      settings = {
        theme = "monokai_pro_octagon";
        editor.line-number = "relative";
        editor.shell = ["zsh" "-c"];
      };
      themes = {
        monokai_pro_octagon = let
          red      = "#ff657a";
          orange   = "#ff9b5e";
          yellow   = "#ffd76d";
          green    = "#bad761";
          blue     = "#9cd1bb";
          purple   = "#c39ac9";
          base0    = "#161821";
          base1    = "#1e1f2b";
          base2    = "#282a3a";
          base3    = "#3a3d4b";
          base4    = "#535763";
          base5    = "#696d77";
          base6    = "#767b81";
          base7    = "#b2b9bd";
          base8    = "#eaf2f1";
          base8x0c = "#303342";
        in {
          "ui.linenr.selected" = { bg = base3; };          "ui.text.focus" = { fg = yellow; modifiers = ["bold"]; };          "ui.menu" = { fg = base8; bg = base3; };          "ui.menu.selected" = { fg = base2; bg = yellow; };          "ui.virtual.whitespace" = base5;          "ui.virtual.ruler" = { bg = base1; };          "info" = base8;          "hint" = base8;          "ui.background" = {};          "ui.statusline.inactive" = { fg = base8; bg = base8x0c; };          "ui.statusline" = { fg = base8; bg = base4; };          "ui.statusline.normal" = { fg = base4; bg = blue; };          "ui.statusline.insert" = { fg = base4; bg = green; };          "ui.statusline.select" = { fg = base4; bg = purple; };          "ui.popup" = { bg = base3; };          "ui.window" = { bg = base3; };
          "ui.help" = { fg = base8; bg = base3; };
          "ui.selection" = { bg = base4; };
          "ui.cursor.match" = { bg = base4; };
          "ui.cursorline" = { bg = base1; };
          "comment" = { fg = base5; modifiers = ["italic"]; };
          "ui.linenr" = { fg = base5; };
          "ui.cursor.primary" = { fg = base7; modifiers = ["reversed"]; };
          "attribute" = blue;
          "variable" = base8;
          "constant" = orange;
          "variable.builtin" = red;
          "constant.builtin" = red;
          "namespace" = base8;
          "ui.text" = { fg = base8; };
          "punctuation" = base6;
          "type" = green;
          "type.builtin" = { fg = red; };
          "label" = base8;
          "constructor" = blue;
          "function" = green;
          "function.macro" = { fg = blue; };
          "function.builtin" = { fg = "cyan"; };
          "operator" = red;
          "variable.other.member" = base8;
          "keyword" = { fg = red; };
          "keyword.directive" = blue;
          "variable.parameter" = "#f59762";
          "error" = red;
          "special" = "#f59762";
          "module" = "#f59762";
          "warning" = "orange";
          "constant.character.escape" = { fg = base8; };
          "string" = yellow;
          "constant.numeric" = purple;
          "diff.plus" = green;
          "diff.delta" = "orange";
          "diff.minus" = red;
          "diagnostic.warning" = { underline = { color = "orange"; style = "curl"; }; };
          "diagnostic.error" = { underline = { color = red; style = "curl"; }; };
          "diagnostic.info" = { underline = { color = base8; style = "curl"; }; };
          "diagnostic.hint" = { underline = { color = base8; style = "curl"; }; };
          "markup.heading" = green;
          "markup.bold" = { fg = "orange"; modifiers = ["bold"]; };
          "markup.italic" = { fg = "orange"; modifiers = ["italic"]; };
          "markup.strikethrough" = { modifiers = ["crossed_out"]; };
          "markup.link.url" = { fg = "orange"; modifiers = ["underlined"]; };
          "markup.link.text" = yellow;
          "markup.quote" = green;
        };
      };
    };
}