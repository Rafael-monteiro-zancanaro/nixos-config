{ pkgs, ... }: {
	home.packages = with pkgs; [
		discord
		spotify
		todoist-electron
	];
}
