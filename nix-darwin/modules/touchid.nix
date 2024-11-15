{ config, pkgs, lib, ... }:

{
  # Run a script during system activation to configure Touch ID for sudo
  system.activationScripts.enableTouchID = {
    text = ''
      echo "Enabling Touch ID for sudo..."
      if ! grep -q "pam_tid.so" /etc/pam.d/sudo; then
        echo "auth sufficient pam_tid.so" | sudo tee -a /etc/pam.d/sudo
        echo "Touch ID enabled for sudo."
      else
        echo "Touch ID is already enabled for sudo."
      fi
    '';
  };
}
