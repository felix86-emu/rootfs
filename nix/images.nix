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
      contents = [
        (pkgs.buildEnv {
          name = "fhs-rootfs";
          paths = packages;
          pathsToLink = [
            "/bin"
            "/etc"
            "/lib"
            "/lib64"
            "/sbin"
          ];
        })
      ];
    };

  commonPackages = import ./packages.nix pkgs;
in

{
  ubuntu = mkImage {
    name = "ubuntu";
    baseImage = baseImages.ubuntu."24_04";
    packages = commonPackages;
  };
}
