{
  power.ups = {
    enable = true;
    mode = "netserver";
    upsd = {
      listen = [
        {
          address = "127.0.0.1";
          port = 3493;
        }
        {
          address = "::1";
          port = 3493;
        }
      ];
    };
    ups = {
      ups = {
        driver = "usbhid-ups";
        port = "auto";
        directives = [
          "vendorid = 0764"
          "productid = 0501"
          "pollinterval = 15"
        ];
      };
    };
    users.upsmon = {
      passwordFile = "/home/dan/nixos/hosts/sixer/ups-password.txt";
      upsmon = "primary";
    };
    users.hass = {
      passwordFile = "/home/dan/nixos/hosts/sixer/hass-ups-password.txt";
    };
    upsmon.monitor.ups = {
      system = "ups@localhost";
      user = "upsmon";
      passwordFile = "/home/dan/nixos/hosts/sixer/ups-password.txt";
      type = "primary";
    };
  };
}