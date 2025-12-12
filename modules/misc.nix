{ pkgs, ... }: {

	imports = [
		./vim/default.nix
		./kitty/default.nix
	];
	
	home.packages = with pkgs; [
		discord
		spotify
		todoist-electron
	];
}
