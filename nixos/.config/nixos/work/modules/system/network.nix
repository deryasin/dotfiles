# network.nix
{ config, ...}:
{
  networking.hostName = "AST101412";
  #networking.wireless.enable = true;
  #networking.wireless.userControlled.enable = true;
  networking.networkmanager.enable = true;
  #networking.networkmanager.dns = "none";
  networking.enableIPv6  = false;
  networking.interfaces.enp3s0f0.useDHCP = true; 
}

