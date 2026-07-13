{ pkgs, ... }:

# IDE Packages - Relevant packages for code editing

let
  aiFeatures = with pkgs; [
    codex
    codex-acp
  ];

  ideFeatures = with pkgs; [
    nixfmt
  ];

  dbFeatures = with pkgs; [
    postgresql
  ];

  features = aiFeatures ++ ideFeatures ++ dbFeatures;
in
{
  home.packages =
    with pkgs;
    features
    ++ [
      zed-editor
      jetbrains.idea
      dbeaver-bin
      devenv
    ];
}
