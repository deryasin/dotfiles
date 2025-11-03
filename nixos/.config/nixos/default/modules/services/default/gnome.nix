{ config, ...}:
{
  services = {
    gnome = {
      gnome-keyring.enable = true;
      #seahorse.enable = true;
      at-spi2-core.enable = true;
    };
  };
}
