{ config, pkgs, ... }:
{
  programs.kdeconnect.enable = true; 
  programs.java = { enable = true; package = pkgs.jdk21; };
  programs.wireshark = { enable = true; };
  programs.openvpn3 = { enable = true; };
  programs.localsend = {
    enable= true;
    openFirewall = true;
    };
}
