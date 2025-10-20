{ pkgs, ... }: {
	home.packages = with pkgs; [
		vscode
		jetbrains.idea-community
		# postgresql <- Tem coisa a mais pra configurar aqui
	];
}
