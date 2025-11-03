# nix.nix
{ config, lib, pkgs, ... }:
{
  nixpkgs = {
    config= {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-20.3.12"
        "electron-27.3.11"
      ];
    };
  };
  nix = {
    #package = nixVersions.stable;
    #extraOptions = lib.optionalString (config.nix.package == nixVersions.stable)
    #  "experimental-features = nix-command flakes";
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
