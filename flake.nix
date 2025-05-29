{
  description = "namah nix-darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:nix-darwin/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    # nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    # nix-homebrew.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ darwin, nixpkgs, home-manager, ... }:
    let
      configuration = { pkgs, config, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget

        nixpkgs.config.allowUnfree = true;

        environment.systemPackages = with pkgs; [
          alacritty
          bat
          btop
          duf
          dust
          eza
          fd
          fzf
          gnupg
          ncdu
          neovim
          procs
          ripgrep
          rustscan
          sd
          tealdeer
          tmux
          wget
          yazi
          zoxide
          # pkgs.ugm
          # pkgs.netscanner
        ];

        fonts.packages = with pkgs; [
          nerd-fonts.jetbrains-mono
          nerd-fonts.hack
        ];

        # homebrew = {
        #   enable = false;
        #   brews = [
        #     "pinentry-mac"
        #     # "mas"
        #   ];
        #   casks = [
        #     "firefox"
        #     "aerospace"
        #     "nikitabobko/tap/aerospace"
        #     "keepassxc"
        #     "raycast"
        #     "karabiner-elements"
        #     "1password"
        #   ];
        #     # "hammerspoon"
        #     # "iina"
        #     # "the-unarchiver"
        #   taps = [
        #     "nikitabobko/tap"
        #   ];
        #   masApps = {
        #     # "Yoink" = 457622435;
        #   };
        #   onActivation.cleanup = "zap";
        #   # onActivation.autoUpdate = true;
        #   # onActivation.upgrade = true;
        # };

        # for only home-manager
        # outputs = { nixpkgs, home-manager, ... }: {
        #   homeConfigurations = {
        #     "<username>" = home-manager.lib.homeManagerConfiguration {
        #       # darwin is the macOS kernel and aarch64 means ARM, i.e. apple silicon
        #       pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        #       modules = [ ./home.nix ];
        #     };
        #   };
        # };
        # nix run github:nix-community/home-manager -- switch --flake

        system.primaryUser = "kamal";
        system.defaults = {
          dock.autohide = true;
          dock.persistent-apps = [
            "/System/Applications/Mail.app"
            "/Applications/Firefox.app"
            "${pkgs.obsidian}/Applications/Obsidian.app"
            "${pkgs.alacritty}/Applications/Alacritty.app"
          ];
          finder.FXPreferredViewStyle = "clmv";
          screencapture.location = "~/Pictures/screenshots";
          loginwindow.GuestEnabled = false;
          NSGlobalDomain.AppleInterfaceStyle = "Dark";
          NSGlobalDomain.AppleICUForce24HourTime = false;
          NSGlobalDomain.AppleShowAllExtensions = true;
          NSGlobalDomain.KeyRepeat = 1;
        };

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Enable alternative shell support in nix-darwin.
        programs.zsh.enable = true;
        # programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        # system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 6;

        programs.direnv.enable = true;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";

        users.users.kamal.home = "/Users/kamal";
      };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#kamal
      darwinConfigurations."kamal" = darwin.lib.darwinSystem {
        modules = [
          configuration
          # nix-homebrew.darwinModules.nix-homebrew
          # {
          #   nix-homebrew = {
          #     enable = false;
          #     enableRosetta = true;
          #     user = "kamal";
          #     autoMigrate = true;
          #   };
          # }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kamal = import ./home.nix;
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      # darwinPackages = self.darwinConfigurations."kamal".pkgs;
    };
}
