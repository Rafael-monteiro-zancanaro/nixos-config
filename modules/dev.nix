{ config, pkgs, ... }: {
	imports = [
		./git/default.nix
		./vscode/default.nix
	];

	home.packages = with pkgs; [
		jetbrains.idea-community
		# postgresql <- Tem coisa a mais pra configurar aqui
	];
}
