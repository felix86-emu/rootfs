# nix run nixpkgs#nix-prefetch-docker -- --image-name <name> --image-tag <tag>
{
  ubuntu = {
    "24_04" = {
      imageName = "ubuntu";
      imageDigest = "sha256:c4a8d5503dfb2a3eb8ab5f807da5bc69a85730fb49b5cfca2330194ebcc41c7b";
      hash = "sha256-4fNRgZzYvIKgzdJDOK5IH5fBkmzQQNMIDAEVoQj56Uk=";
      finalImageName = "ubuntu";
      finalImageTag = "24.04";
    };
  };
}
