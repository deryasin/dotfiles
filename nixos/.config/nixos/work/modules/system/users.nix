# users.nix
{ config, lib, pkgs, ... }:

{
  users.users.yasin = {
    isNormalUser = true;
    home = "/home/yasin";
    extraGroups = [ "wheel" "networkmanager" "dialout" "scanners" "lp" "tty" "input" "libvirtd" "libvirt" "wireshark" "kvm" "docker" "wireshark"];
  };
  users.defaultUserShell = pkgs.zsh;
  #programs.home-manager.enable = true;
}

