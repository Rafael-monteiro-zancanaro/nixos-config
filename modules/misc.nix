{ pkgs, ... }: {

	imports = [
		./vim/default.nix
	];
	
	home.packages = with pkgs; [
		discord
		spotify
		todoist-electron
	];
}
