# nix run nixpkgs#nix-prefetch-docker -- --image-name <name> --image-tag <tag>
{
  nix = {
    "2.32.8" = {
      imageName = "nixos/nix";
      imageDigest = "sha256:080e6df285c98b2ea34080bf3762308288e73d7f4012e3bcf96bb98911a24311";
      hash = "sha256-ig7SHiZff4eP+xEK4+Qnv3qaoC5X+YXtDaJseqd4OLs=";
      finalImageName = "nixos/nix";
      finalImageTag = "2.32.8";
    };
  };
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
