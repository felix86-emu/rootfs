{
  pkgs,
  lib,
}:

let
  # recursively pull leaf base images
  baseImages = lib.mapAttrsRecursiveCond (value: !(value ? "imageName")) (
    _name: value: pkgs.dockerTools.pullImage value
  ) (import ./base-images.nix);

  mkImage =
    {
      name,
      baseImage ? null,
      packages,
    }:
    pkgs.dockerTools.buildLayeredImage {
      name = name;
      tag = "latest";
      fromImage = baseImage;
      contents = packages;
    };

  # TODO: create an image for each type (minimal, full)
  commonPackages = import ./packages.nix {
    inherit pkgs lib;
    type = "minimal";
  };
in

{
  nix = mkImage {
    name = "nix";
    baseImage = baseImages.nix."2.32.8";
    packages = commonPackages;
  };
  ubuntu = mkImage {
    name = "ubuntu";
    baseImage = baseImages.ubuntu."24_04";
    packages = commonPackages;
  };
}
