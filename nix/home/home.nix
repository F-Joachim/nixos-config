{ config, pkgs, ... }:

{
  imports =
    [
      ../nixconfig.nix
      ./git.nix
      ./docker.nix
      ./bash.nix
      ./vscode.nix
      ./kde-plasma.nix
    ];

  home = {
    username = config.nixconfig.userdata.username;
    homeDirectory = config.nixconfig.userdata.home;

    # Packages that should be installed to the user profile.
    packages = with pkgs; [
      firefox
      google-chrome
      nnn # terminal file manager

      # archives
      zip
      xz
      unzip
      p7zip

      # utils
      ripgrep # recursively searches directories for a regex pattern
      jq # A lightweight and flexible command-line JSON processor
      yq-go # yaml processor https://github.com/mikefarah/yq
      eza # A modern replacement for ‘ls’
      fzf # A command-line fuzzy finder
      meld # Visual diff and merge tool

      # networking tools
      mtr # A network diagnostic tool
      iperf3
      dnsutils # `dig` + `nslookup`
      socat # replacement of openbsd-netcat
      nmap # A utility for network discovery and security auditing

      # nix related
      #
      # it provides the command `nom` works just like `nix`
      # with more details log output
      nix-output-monitor

      direnv
    ];

    # This value determines the home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update home Manager without changing this value. See
    # the home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.11";
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
