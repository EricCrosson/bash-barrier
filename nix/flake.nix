{
  description = "bash-barrier dev shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    pre-commit-hooks,
  }: let
    forEachSystem = nixpkgs.lib.genAttrs [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  in {
    devShells = forEachSystem (system: let
      checks = {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ../.;
          hooks = {
            alejandra.enable = true;
            prettier.enable = true;
            shellcheck.enable = true;
            shfmt.enable = true;
          };
        };
      };
    in {
      default = nixpkgs.legacyPackages.${system}.mkShell {
        inherit (checks.pre-commit-check) shellHook;
      };
    });
  };
}
