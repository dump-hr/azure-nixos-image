let
  nixos_version = "22.05";
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-${nixos_version}.tar.gz") {};
  machine = import (pkgs.path + "/nixos/lib/eval-config.nix") {
    system = "x86_64-linux";
    modules = [
      ({config, ...}: { imports = [ ./system.nix ]; })
    ];
  };
in
  machine.config.system.build.azureImage
