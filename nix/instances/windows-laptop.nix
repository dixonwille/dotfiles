{ config, pkgs, lib, ... }:
{
  imports = [
    ../base
    ../neovim
  ];
  config = {
    profiles.base = {
      username = "wdixon";
      machine = "winlap";
      _1password.enable = true;
      git = {
        email = "will@willd.io";
        signing.enable = true;
      };
      wsl = {
        enable = true;
        windows.username = "wdixon";
      };
    };
  };
}
