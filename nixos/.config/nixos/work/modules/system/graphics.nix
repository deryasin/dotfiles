# graphics.nix
{ config, lib, pkgs, hyprland, inputs, ...}:
{
  services.xserver.videoDrivers = ["amdgpu"];
  hardware.opengl = {
    enable = true;
    #package = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.mesa.drivers;
    #driSupport = true;
    driSupport32Bit = true;
    #setLdLibraryPath = true;
    #extraPackages = with pkgs; [
    #  libGL
    #  vaapiVdpau
    #  libvdpau-va-gl
    #  mesa.drivers
    #];
  #package32 = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.pkgsi686Linux.mesa.drivers;
  };
}

