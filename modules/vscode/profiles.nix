{ config, pkgs, lib, ... }:
{
  programs.vscode.profiles = {
    default = {
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        jnoortheen.nix-ide
      ];
  #     userSettings = builtins.fromJSON ''
	# {
	#     "workbench.sideBar.location": "right",
	#     "vim.useSystemClipboard": true,
	#     "vim.normalModeKeyBindings": [ { "before": ["<Space>"], "after": [":"] } ],
	#     "vim.insertModeKeyBindings": [ { "before": ["j", "k"], "after": ["<Esc>"] } ],
	#     "vim.handleKeys": { "<C-d>": true, "<C-s>": false, "<C-z>": false, "<C-f>": false, "<C-p>": false }
	# }	
  #     '';
    };
  };
}
