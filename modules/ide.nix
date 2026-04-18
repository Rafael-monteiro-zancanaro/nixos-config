{ home, pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.idea-oss
    jetbrains.pycharm-oss
  ];
}
