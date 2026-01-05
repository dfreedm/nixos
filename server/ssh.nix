{
  services.openssh = {
    enable = true;
    settings = {
      # Require keys only
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      # Disable root login
      PermitRootLogin = "no";
      # Only I can log in
      AllowUsers = [ "dan" ];
    };
  };
}
