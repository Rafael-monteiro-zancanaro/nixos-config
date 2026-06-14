{ pkgs, ... }:

# Languages - Packages for programming languages
# TODO: Maybe separate into specific language modules (i.e. rust.nix, python.nix, etc.)

let
  rustdeps = with pkgs; [
    cargo
    rustc
    rustfmt
    clippy
    rust-analyzer
    pkg-config
    openssl
  ];
in
{
  home.packages = rustdeps ++ [
  ];
}
