{ pkgs, ... }:

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
