{ config, pkgs, ... }: {
	imports = [
		./git/default.nix
	];

	home.packages = with pkgs; [
		vscode
		jetbrains.idea-community
		# postgresql <- Tem coisa a mais pra configurar aqui
	];
}
