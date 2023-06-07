{
  description = "Build, test, and lint Stack-based Haskell projects in your CircleCI jobs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devenv.url = "github:cachix/devenv";
    nix2container.url = "github:nlewo/nix2container";
    nix2container.inputs.nixpkgs.follows = "nixpkgs";
    mk-shell-bin.url = "github:rrbutani/nix-mk-shell-bin";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.devenv.flakeModule
      ];

      systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      perSystem = { config, self', inputs', pkgs, system, ... }: {
        # https://devenv.sh/reference/options/
        devenv.shells.default = {
          name = "stack-build-orb";

          packages = [
            pkgs.circleci-cli
          ];

          pre-commit.hooks = {
            nixpkgs-fmt.enable = true;
            yamllint.enable = true;
          };
        };

      };
    };
}
