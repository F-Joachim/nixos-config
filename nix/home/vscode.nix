{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      asciidoctor.asciidoctor-vscode
      davidanson.vscode-markdownlint
      github.copilot
      github.copilot-chat
      haskell.haskell
      jnoortheen.nix-ide
      justusadam.language-haskell
      mhutchie.git-graph
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-containers
      shd101wyy.markdown-preview-enhanced
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "hadolint";
        version = "1.1.2";
        publisher = "exiasr";
        sha256 = "6GO1f8SP4CE8yYl87/tm60FdGHqHsJA4c2B6UKVdpgM=";
      }
    ];
  };
}
