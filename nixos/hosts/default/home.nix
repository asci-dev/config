{ config, pkgs, ... }:

{
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 48;
  };

  home.username = "asci";
  home.homeDirectory = "/home/asci";

  home.stateVersion = "24.05";

  programs.direnv.enable = true;

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];
  };

  programs.rtorrent = {
    enable = true;
  };

  programs.kitty = {
    enable = true;

    font = {
      name = "Lekton Nerd Font";
      size = 14;
    };

    theme = "Tokyo Night";

    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
    };
  };

  programs.git = {
    enable = true;

    userName  = "asci-dev";
    userEmail = "104984373+2oo0k@users.noreply.github.com";

    delta = {
    	enable = true;
    };

    aliases = {
      p = "push";
      g = "grep --break --heading --line-number";
      co = "checkout";
      cm = "commit -m";
      st = "status --branch --short";
      la = "!git config -l | rg alias | cut -c 7-";
      ls = "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue) <%an>%Creset' --decorate";
      ll = "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue) <%an>%Creset' --decorate --numstat";
      ld = "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue) <%an>%Creset' --decorate --date=short";
    };

    extraConfig = {
      init = {
        defaultBranch = "trunk";
      };
      grep = {
        extendRegexp = true;
        lineNumber = true;
      };
    };
  };

  home.packages = [
    pkgs.age
    pkgs.brightnessctl
    pkgs.calibre
    pkgs.docker-compose
    pkgs.dua
    pkgs.dolphin
    pkgs.fd
    pkgs.htop
    pkgs.kitty
    pkgs.mpv
    pkgs.networkmanagerapplet
    pkgs.nmap
    pkgs.ripgrep
    pkgs.rtorrent
    pkgs.sops
    pkgs.tdns-cli
    pkgs.tree
    pkgs.wget
    pkgs.zig
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/asci/etc/profile.d/hm-session-vars.sh
  #

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
