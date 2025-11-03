{ config, pkgs, ...}:
{
  virtualisation = {
    containers.enable = true;
    waydroid = {
        enable = true;
      };
    docker = {
      rootless = {
          enable = true;
          setSocketVariable = true;
      daemon.settings = {
        dns = [ "1.1.1.1" "8.8.8.8" ];
        };
      };
      enable = true;   
    };
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
        swtpm.enable = true;
        runAsRoot = false;
        vhostUserPackages = with pkgs; [ virtiofsd ];
      };
    };
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      #dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
};   
environment.sessionVariables.LIBVIRT_DEFAULT_URI = [ "qemu:///system" ];
  environment.systemPackages = with pkgs; [ virt-manager win-virtio swtpm];
}

