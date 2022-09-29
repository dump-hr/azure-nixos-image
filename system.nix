{ pkgs, modulesPath, ... }:
let
  username = "dumpovac";
  authorizedKeysURL = "";
  authorizedKeysSHA = "";
in
{
  imports = [
    "${modulesPath}/virtualisation/azure-common.nix"
    "${modulesPath}/virtualisation/azure-image.nix"
  ];

  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    # make this part more dynamic
    #openssh.authorizedKeys.keys = let
    #  authorizedKeys = pkgs.fetchurl {
    #    url = "<url to public keys>";
    #    sha256 = "1kril7clfay225xdfhpp770gk60g5rp66nr6hzd5gpxvkynyxlrf";
    #  };
    #in pkgs.lib.splitString "\n" (builtins.readFile authorizedKeys);
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuAQ43SM0EVulTuivIuAGI0P2RcREUY0nTRtlolZDZ bartol@dump.hr"
    ];
  };
  services.openssh.passwordAuthentication = false;
  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    vim git tmux htop curl wget
  ];

  virtualisation.azureImage.diskSize = 2500;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  system.stateVersion = "22.05";
}
