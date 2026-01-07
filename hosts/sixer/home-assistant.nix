# Home Assistant container
{
  virtualisation.oci-containers.containers.hass = {
    image = "ghcr.io/home-assistant/home-assistant:stable";
    environment.TZ = "America/Los_Angeles";
    volumes = [
      "/home/dan/home-assistant:/config"
    ];
    extraOptions = [
      "--network=host"
    ];
  };

  # Enable linger so the container can run without user login
  users.users.dan.linger = true;

  # Open firewall
  networking.firewall.allowedTCPPorts = [ 8123 ];
}
