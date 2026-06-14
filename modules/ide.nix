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

  features = aiFeatures ++ ideFeatures;
in
{
  home.packages =
    with pkgs;
    features
    ++ [
      zed-editor
    ];
}
