{
  description = "My Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.aerospace
          pkgs.bat
          pkgs.colorls
          pkgs.delta
          pkgs.fd
          pkgs.fzf
          pkgs.jq
          pkgs.lazygit
          pkgs.mkalias
          pkgs.neovim
          pkgs.nodejs_22
          pkgs.pass
          pkgs.ripgrep
          pkgs.skhd
          pkgs.spicetify-cli
          pkgs.tlrc
          pkgs.tmux
          pkgs.yarn
          pkgs.yazi
        ];

      homebrew = {
        enable = true;
        brews = [
          "borders"
          "cmake"
          "hwloc"
          "libuv"
          "lua"
          "nowplaying-cli"
          "openssl"
          "sketchybar"
          "switchaudio-osx"
        ];
        casks = [
          "arc"
          "balenaetcher"
          "command-x"
          "discord"
          "ghostty"
          "karabiner-elements"
          "monero-wallet"
          "mos"
          "obsidian"
          "raycast"
          "selfcontrol"
          "sf-symbols"
          "spotify"
          "wezterm"
        ];
        taps = [
          "FelixKratz/formulae"
        ];
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };

        system.activationScripts.applications.text = let
          env = pkgs.buildEnv {
           name = "system-applications";
           paths = config.environment.systemPackages;
           pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
          # Set up applications.
          echo "setting up /Applications..." >&2
          rm -rf /Applications/Nix\ Apps
          mkdir -p /Applications/Nix\ Apps
          find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
          while read -r src; do
            app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
        '';

      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "icnv";
        loginwindow.GuestEnabled = false;
        loginwindow.SHOWFULLNAME = true;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 2;
        screencapture.location = "~/Downloads";
        screensaver.askForPasswordDelay = 10;
      };

      # Added functionality for TouchID while using sudo
      security.pam.enableSudoTouchIdAuth = true;

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Lawsons-MacBook-Pro
    darwinConfigurations."Lawsons-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ 
      configuration
      nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "lawsonguilbeau";
            };
          }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Lawsons-MacBook-Pro".pkgs;
  };
}
