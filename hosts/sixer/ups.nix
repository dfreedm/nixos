{
  power.ups = {
    enable = true;
    mode = "netserver";
    ups = {
      ups = {
        driver = "usbhid-ups";
        port = "auto";
        pollinterval = 15;
      };
    };
  };
}
