# Absolute minimum infrastructure defition for running tests etc.
{ config, lib, ... }:

{
  config = lib.mkIf (config.flyingcircus.infrastructureModule == "testing") {
    boot.loader.grub.device = "/dev/sda";
    fileSystems."/".device = "/dev/disk/by-label/nixos";
    networking.useDHCP = lib.mkForce false;
    users.users.root.password = "";

    flyingcircus.agent.install = false;
    flyingcircus.enc = {
      parameters.resource_group = "testrg";
      parameters.location = "testloc";
      name = "testvm";
    };
    services.openssh.enable = lib.mkOverride 60 false;
    security.rngd.enable = false;
  };
}
