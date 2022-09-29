with import <nixpkgs> { };
stdenv.mkDerivation {
  name = "azure-nixos-image_env";

  nativeBuildInputs = [
    azure-cli
    azure-storage-azcopy
    bash
    jq
    cacert
  ];

  AZURE_CONFIG_DIR="/tmp/azure-cli/.azure";
}
