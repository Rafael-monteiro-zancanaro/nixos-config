{ config, pkgs, lib, ... }:
{
  programs.vscode.profiles = {
    default = {
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
 #       jnoortheen.nix-ide
      ];
      userSettings = {
 #       "vim.normalModeKeyBindings" = ''
 #       [ { "before": ["<Space>"], "after": [":"] } ]
 #       '';
 #       "vim.insertModeKeyBindings" = ''
 #       [ { "before": ["j", "k"], "after": ["<Esc>"] } ]
 #       '';
        "workbench.sideBar.location" = "right";
 #       "vim.useSystemClipboard" = "true";
 #       "vim.handleKeys" = ''
 #       { "<C-d>": true, "<C-s>": false, "<C-z>": false, "<C-f>": false, "<C-p>": false }
 #       '';
      };
    };
  };
}
