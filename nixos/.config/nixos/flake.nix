{
  description = "Filesystem-based module system for Nix";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    #nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    #nixpkgs-wayland.inputs.nixpkgs.follows = "nixpkgs";
    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    #hyprland = {
    #  url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
     # inputs.nixpkgs.follows = "nixpkgs";
    #};
};

  outputs = inputs @ { self, nixpkgs, zen-browser, winapps, ... }:
  let
    predefinedVariables = (import ./variables.nix);
    unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
    pkgs = import nixpkgs {
      overlays = [
        (import ./default/overlays/electron.nix)
        (self: super: { lutris = super.lutris.override { extraLibraries = pkgs: [pkgs.libunwind ]; }; })
      ];
      config = {
        allowUnfree = true;
        allowInsecure = true;
        allowBroken = true;
      };
    };
  in
  

  {
   nixosConfigurations = {
     home = nixpkgs.lib.nixosSystem rec { # https://nix.dev/manual/nix/2.17/language/constructs
       specialArgs = { inherit predefinedVariables; inherit pkgs; inherit unstable; };
       modules = [
          ./default/pkgs
	        ./default/modules
          ./home/configuration.nix
          ./home/hardware-configuration.nix
          ./home/modules
         ];
     };

     work = nixpkgs.lib.nixosSystem rec {
       specialArgs = { inherit predefinedVariables; inherit pkgs; inherit unstable; inherit inputs; inherit winapps; };
       modules = [
          ./default/pkgs
          ./work/configuration.nix
          ./work/hardware-configuration.nix
          ./work/modules
	        ./default/modules
         ];
     };
   };
  };
}

