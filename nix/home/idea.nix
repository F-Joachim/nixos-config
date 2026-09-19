{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      nodejs # Need this for copilot plugin 🙈
      jetbrains.idea
    ];
  };
}