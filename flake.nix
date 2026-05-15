{
  description = "felix86 x86/x86_64 rootfs built with Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        lib = pkgs.lib;

        # nix build .#image-name
        images = import ./nix/images.nix { inherit pkgs lib; };

        # nix run .#image-name-rootfs
        rootfs-scripts = import ./nix/rootfses.nix { inherit images pkgs lib; };

        # nix run .#build-all
        build-all = pkgs.writeShellScriptBin "build-rootfs-all" (
          lib.concatLines (map (c: c.text) (lib.attrValues rootfs-scripts))
        );
      in
      {
        packages = {
          inherit build-all;
        }
        // images
        // rootfs-scripts;
      }
    );
}
