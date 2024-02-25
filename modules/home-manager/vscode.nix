{ pkgs, config, lib, ...}:
{
      programs.vscode = {
      enable = false;
      package = pkgs.vscode.fhs;
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = false;
      userSettings = {
        "workbench.colorTheme" = "Monokai Pro (Filter Octagon)";
        "workbench.startupEditor" = "none";
        "workbench.iconTheme" = "Monokai Pro Icons";
        "git.autofetch" = true;
        "redhat.telemetry.enabled" = false;
        "svelte.enable-ts-plugin" = true;
        "window.menuBarVisibility" = "compact";
        "prettier.singleQuote" = true;
        "prettier.useTabs" = true;
        "prettier.bracketSpacing" = false;
        "prettier.htmlWhitespaceSensitivity" = "strict";
        "typescript.updateImportsOnFileMove.enabled" = "always";
        "editor.fontFamily" = "OpenDyslexic, OpenDyslexic Mono NF";
        "rust-analyzer.inlayHints.chainingHints.enable" = false;
        "rust-analyzer.inlayHints.closingBraceHints.enable" = false;
        "rust-analyzer.inlayHints.renderColons" = false;
        "rust-analyzer.inlayHints.parameterHints.enable" = false;
        "editor.minimap.enabled" = false;
        "editor.inlineSuggest.enabled" = true;
        "window.zoomLevel" = 1;
      };
    };
}
