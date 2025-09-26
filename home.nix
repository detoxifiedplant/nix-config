{ config, pkgs, ... }:

{
  home.username = "kamal";
  home.homeDirectory = "/Users/kamal";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    atuin
    bruno
    chafa
    dbgate
    fastfetch
    lazygit
    librewolf
    mkalias
    noto-fonts
    noto-fonts-emoji
    obsidian
    onefetch
    silicon
    starship
    tokei
    tree
    trippy
    vscodium
    zola
    aerospace
    firefox
    xh
    raycast
    karabiner-elements
    _1password
    # nikitabobko/tap/aerospace
    # keepassxc
    # pinentry-mac
    # civo
    # csview
    # delta
    # devbox
    # direnv
    # discord
    # dive
    # grype
    # kns
    # krew
    # pandoc
    # postgresql_17
    # syft
    # thefuck
    # tuckr
    # yq-go
    # zoom-us
    # zsh-autosuggestions
    # zsh-syntax-highlighting

    # with brew
    # awscli
    # duckdb
    # libnghttp2
    # mpdecimal
    # postgresql@14
    # uvwasi
    # bottom
    # gh
    # libnghttp3
    # musl-cross
    # python@3.13
    # xz
    # brotli
    # htop
    # libngtcp2
    # ncurses
    # readline
    # yq
    # c-ares
    # icu4c@77
    # libuv
    # node
    # simdjson
    # zstd
    # ca-certificates
    # krb5
    # lz4
    # openssl@3
    # sqlite
    # clickhouse
    # obs
    # vial
    # warp
    # notunes
    # slack
    # vlc
  ];

  home.sessionVariables = { };

  home.sessionPath = [
    "/run/current-system/sw/bin"
    "$HOME/.nix-profile/bin"
  ];

  programs.home-manager.enable = true;
  programs.home-manager.path = "$HOME/devel/home-manager";
  # xdg.enable = true;
  # home.file.".config" = { source = ./config; recursive = true; };

  programs.bat = {
    enable = true;
    config.theme = "catppuccin-macchiato";
    themes = {
      catppuccin-macchiato = {
        src = pkgs.fetchFromGitHub {
          "owner" = "catppuccin";
          "repo" = "bat";
          "rev" = "d2bbee4f7e7d5bac63c054e4d8eca57954b31471";
          "sha256" = "x1yqPCWuoBSx/cI94eA+AWwhiSA42cLNUOFJl7qjhmw=";
        };
        file = "themes/Catppuccin Macchiato.tmTheme";
      };
    };
  };

  programs.git = {
    enable = true;
    delta.enable = true;
    lfs.enable = true;
    userName = "kamal";
    userEmail = "detoxifiedplant@gmail.com";
    signing = {
      key = "2E3AC57445864FC1";
      signByDefault = true;
    };
    aliases = {
      co = "checkout";
      ci = "commit";
      cia = "commit --amend";
      s = "status";
      st = "status";
      b = "branch";
      p = "pull --rebase";
      pu = "push";
    };
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
      # delta.features = "catpuccin-macchiato";
      # delta.navigate = true;
      pull.rebase = true;
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      git.paging = {
        colorArg = "always";
        pager = "delta --dark --paging=never";
      };
      gui.theme = {
        activeBorderColor = [ "#f5a97f" "bold" ];
        inactiveBorderColor = [ "#a5adcb" ];
        optionsTextColor = [ "#8aadf4" ];
        selectedLineBgColor = [ "#363a4f" ];
        cherryPickedCommitBgColor = [ "#494d64" ];
        cherryPickedCommitFgColor = [ "#f5a97f" ];
        unstagedChangesColor = [ "#ed8796" ];
        defaultFgColor = [ "#cad3f5" ];
        searchingActiveBorderColor = [ "#eed49f" ];
      };
      gui.authorColor = {
        "*" = "#b7bdf8";
      };
    };
  };

  # programs.zsh = {
  #   enable = true;
  #   autosuggestion.enable = true;
  #   syntaxHighlighting.enable = true;
  # };
  #
  # programs.zsh.shellAliases = {
  #   cat = "bat -p";
  #   cdr = "cd $(git rev-parse --show-toplevel)";
  #   clip = "silicon --pad-horiz 0 --pad-vert 0 --background '#ffffff' --theme OneHalfDark --to-clipboard";
  #   gcms = "gaa && gcmsg 'Update' && gp";
  #   grpo = "git remote prune origin";
  #   ll = "ls -l --no-user --no-time";
  #   lla = "ll -a";
  #   tree = "ls --tree";
  #   treel = "tree --long";
  #   lg = "lazygit";
  #   vi = "nvim";
  #   vim = "nvim";
  #   cd = "z";
  #   flakedit = "nvim ~/.dotfiles/nix-darwin/flake.nix";
  # };
  #
  # programs.zsh.sessionVariables = {
  #   JUST_SUPPRESS_DOTENV_LOAD_WARNING = "1";
  #   LANG = "en_US.UTF-8";
  #   EDITOR = "nvim";
  #   VISUAL = "nvim";
  #   HOMEBREW_NO_ENV_HINTS = "false";
  # };
  #
  # programs.zsh.plugins = [
  #   {
  #     name = "zsh-kubectl";
  #     file = "plugins/kubectl/kubectl.plugin.zsh";
  #     src = pkgs.fetchFromGitHub {
  #       owner = "ohmyzsh";
  #       repo = "ohmyzsh";
  #       rev = "ca5471fe496f00007727fd26db762d19519c2e8f";
  #       sha256 = "rI673tQ3W4U9N5i8LZx9dpKzft7+Y0UZ7iTSJwnoSSE=";
  #     };
  #   }
  #   {
  #     name = "zsh-git";
  #     file = "plugins/git/git.plugin.zsh";
  #     src = pkgs.fetchFromGitHub {
  #       owner = "ohmyzsh";
  #       repo = "ohmyzsh";
  #       rev = "ca5471fe496f00007727fd26db762d19519c2e8f";
  #       sha256 = "rI673tQ3W4U9N5i8LZx9dpKzft7+Y0UZ7iTSJwnoSSE=";
  #     };
  #   }
  # ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    colors = "always";
    icons = "always";
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # add_newline = true;
      username = {
        # style_user = "green bold";
        style_user = "";
        style_root = "red bold italic";
        format = "🌼($style)";
        # format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        ssh_symbol = "🌐 ";
        format = "@ [$hostname](#ca9ee6 bold italic) ";
        trim_at = ".local";
        disabled = false;
      };
      character = {
        disabled = false;
        error_symbol = "[❯](bold red)";
        success_symbol = "[❯](bold blue)";
        vimcmd_replace_one_symbol = "[](bold fg:teal)";
        vimcmd_replace_symbol = "[](bold fg:teal)";
        vimcmd_symbol = "[ ](bold fg:color_green)";
        vimcmd_visual_symbol = "[](bold fg:peach)";
      };
      git_status = {
        conflicted = "🔥";
        ahead = "🍀";
        behind = "😰";
        diverged = "😵";
        up_to_date = "✨";
        untracked = "👀";
        stashed = "🫣";
        modified = "🐣";
        staged = "[\($count\)](green)🐥";
        renamed = "🌾";
        deleted = "🗑";
      };
      palette = "catppuccin_macchiato";
      palettes = {
        catppuccin_frappe = {
          base = "#303446";
          blue = "#8caaee";
          crust = "#232634";
          flamingo = "#eebebe";
          green = "#a6d189";
          lavender = "#babbf1";
          mantle = "#292c3c";
          maroon = "#ea999c";
          mauve = "#ca9ee6";
          overlay0 = "#737994";
          overlay1 = "#838ba7";
          overlay2 = "#949cbb";
          peach = "#ef9f76";
          pink = "#f4b8e4";
          red = "#e78284";
          rosewater = "#f2d5cf";
          sapphire = "#85c1dc";
          sky = "#99d1db";
          subtext0 = "#a5adce";
          subtext1 = "#b5bfe2";
          surface0 = "#414559";
          surface1 = "#51576d";
          surface2 = "#626880";
          teal = "#81c8be";
          text = "#c6d0f5";
          yellow = "#e5c890";
        };
        catppuccin_latte = {
          base = "#eff1f5";
          blue = "#1e66f5";
          crust = "#dce0e8";
          flamingo = "#dd7878";
          green = "#40a02b";
          lavender = "#7287fd";
          mantle = "#e6e9ef";
          maroon = "#e64553";
          mauve = "#8839ef";
          overlay0 = "#9ca0b0";
          overlay1 = "#8c8fa1";
          overlay2 = "#7c7f93";
          peach = "#fe640b";
          pink = "#ea76cb";
          red = "#d20f39";
          rosewater = "#dc8a78";
          sapphire = "#209fb5";
          sky = "#04a5e5";
          subtext0 = "#6c6f85";
          subtext1 = "#5c5f77";
          surface0 = "#ccd0da";
          surface1 = "#bcc0cc";
          surface2 = "#acb0be";
          teal = "#179299";
          text = "#4c4f69";
          yellow = "#df8e1d";
        };
        catppuccin_macchiato = {
          base = "#24273a";
          blue = "#8aadf4";
          crust = "#181926";
          flamingo = "#f0c6c6";
          green = "#a6da95";
          lavender = "#b7bdf8";
          mantle = "#1e2030";
          maroon = "#ee99a0";
          mauve = "#c6a0f6";
          overlay0 = "#6e738d";
          overlay1 = "#8087a2";
          overlay2 = "#939ab7";
          peach = "#f5a97f";
          pink = "#f5bde6";
          red = "#ed8796";
          rosewater = "#f4dbd6";
          sapphire = "#7dc4e4";
          sky = "#91d7e3";
          subtext0 = "#a5adcb";
          subtext1 = "#b8c0e0";
          surface0 = "#363a4f";
          surface1 = "#494d64";
          surface2 = "#5b6078";
          teal = "#8bd5ca";
          text = "#cad3f5";
          yellow = "#eed49f";
        };
        catppuccin_mocha = {
          base = "#1e1e2e";
          blue = "#89b4fa";
          crust = "#11111b";
          flamingo = "#f2cdcd";
          green = "#a6e3a1";
          lavender = "#b4befe";
          mantle = "#181825";
          maroon = "#eba0ac";
          mauve = "#cba6f7";
          overlay0 = "#6c7086";
          overlay1 = "#7f849c";
          overlay2 = "#9399b2";
          peach = "#fab387";
          pink = "#f5c2e7";
          red = "#f38ba8";
          rosewater = "#f5e0dc";
          sapphire = "#74c7ec";
          sky = "#89dceb";
          subtext0 = "#a6adc8";
          subtext1 = "#bac2de";
          surface0 = "#313244";
          surface1 = "#45475a";
          surface2 = "#585b70";
          teal = "#94e2d5";
          text = "#cdd6f4";
          yellow = "#f9e2af";
        };
      };
    };
  };

}
