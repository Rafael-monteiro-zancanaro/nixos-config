{ pkgs, ... }: 
{
	imports = [
		./i3/default.nix
	];
	home.packages = with pkgs; [
		discord
		spotify
		todoist-electron
	];
}
