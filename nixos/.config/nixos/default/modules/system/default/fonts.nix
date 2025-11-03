# fonts.nix
{ pkgs, ... }:
{
  #fonts.packages = with pkgs; [
   # nerdfonts
   # noto-fonts
   # noto-fonts-cjk
   # noto-fonts-emoji
   # liberation_ttf
   # fira-code
   # fira-code-symbols
   # mplus-outline-fonts.githubRelease
   # dina-font
   # proggyfonts
  #];
  fonts.fontDir.enable = true;
    fonts.packages = with pkgs; [
      noto-fonts noto-fonts-emoji noto-fonts-cjk-sans
      nerd-fonts.jetbrains-mono
      noto-fonts-color-emoji material-icons
      font-awesome atkinson-hyperlegible
    ];

}
