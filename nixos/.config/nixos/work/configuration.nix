# configuration.nix
{ system, config, pkgs, lib, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
        "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/lenovo/thinkpad/t14/amd"
#      <home-manager/nixos>
    ];
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland];
    wlr.enable = true;
  };
  system.stateVersion = "23.11";
}
