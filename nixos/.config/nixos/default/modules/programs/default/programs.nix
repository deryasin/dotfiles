{ config, pkgs, ... }:
{
  programs.kdeconnect.enable = true; 
  programs.java = { enable = true; package = pkgs.jdk21; };
}
