# configuration.nix
{ system, config, pkgs, lib, inputs, ... }:
{
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  imports =
    [
      ./hardware-configuration.nix
      #"${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/lenovo/thinkpad/l14/amd"
#      #<home-manager/nixos>
    ];
  environment.systemPackages = with pkgs; [
    pkgs.modemmanager
    pkgs.modem-manager-gui
    pkgs.ani-cli
    inputs.winapps.packages.x86_64-linux.winapps
    inputs.winapps.packages.x86_64-linux.winapps-launcher
  ];
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    wlr.enable = true;
  };
  system.stateVersion = "25.05";
  boot.initrd.kernelModules = [ "amdgpu" ];
nix.settings.trusted-substituters = ["https://ai.cachix.org"];
nix.settings.trusted-public-keys = ["ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="];
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [

    # Add any missing dynamic libraries for unpackaged programs

    # here, NOT in environment.systemPackages

  ];
}
