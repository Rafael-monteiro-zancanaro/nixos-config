{ home, pkgs, ... }: 

let {
  rustdeps = with pkgs; [
    cargo 
    rustc
    rustfmt
    clippy
    rust-analyzer
    pkg-config 
    openssl
  ];
} in {
  home.packages = rustdeps;
  # home.packages = with pkgs; rustdeps ++ [
  # ];
}
