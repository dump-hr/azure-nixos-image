{ pkgs, modulesPath, ... }:
{
  imports = [
    "${modulesPath}/virtualisation/azure-common.nix"
    "${modulesPath}/virtualisation/azure-image.nix"
  ];

  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    vim git tmux htop curl wget
  ];

  virtualisation.azureImage.diskSize = 32000;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  system.stateVersion = "22.05";
}
