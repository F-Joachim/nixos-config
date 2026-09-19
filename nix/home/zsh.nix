{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Add aliases for file listing with icons
    shellAliases = {
      ls = "eza --icons";
      ll = "eza -l --icons --git";
      la = "eza -la --icons --git";
      lt = "eza --tree --icons";
      lsd = "eza -l --icons -D"; # List only directories
    };

    history = {
      size = 10000;
      ignoreDups = true;  # Ignore duplicate commands
      ignoreSpace = true; # Ignore commands starting with space
      share = true;       # Share history across all sessions
    };

    # Oh My Zsh configuration
    oh-my-zsh = {
      enable = true;
      plugins = [
        "direnv"
        "docker"
        "docker-compose"
        "emoji"
        "git"
        "fzf" # Set this plugin to be last in the plugin list
      ];
      theme = "half-life";
    };

    initContent = ''
      # Add nix-shell indicator to your prompt
      function nix_shell_prompt() {
        if [ -n "$IN_NIX_SHELL" ]; then
          NIX_ICON=$'\ue843'
          NIX_COLOR_CODE="#699ad7"
          if [ -n "$name" ]; then
            echo "%F{cyan} [%F{$NIX_COLOR_CODE} $NIX_ICON %F{cyan} $name]%f "
          else
            echo "%F{cyan} [%F{$NIX_COLOR_CODE} $NIX_ICON %F{cyan} nix-shell]%f "
          fi
        fi
      }

      # Add the function to your prompt
      export PROMPT="$(nix_shell_prompt)$PROMPT"
    '';
  };
}