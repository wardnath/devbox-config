{
  description = "Custom overrides for Devbox";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      packages.${system} = {
        btop-gpu = pkgs.btop.override {
          cudaSupport = true;
        };
      };
    };
}
