# azure-nixos-image

Build NixOS image for Azure Virtual Machine

Forked from <https://github.com/NixOS/nixpkgs/tree/master/nixos/maintainers/scripts/azure-new>

Script currently builds NixOS version 22.05. When new NixOS version arrives, change version in `upload-image.sh` and `image.nix` and run script again.

## Usage

```sh
$ nix-shell
$ ./upload-image.sh
```
