{ config, pkgs, lib, ... }:
{
  imports = [
    ../base
    ../neovim
  ];
  config = {
    profiles.base = {
      username = "wdixon";
      _1password.enable = false;
      git = {
        email = "wdixon@synergipartners.com";
        signing.enable = false;
      };
      wsl = {
        enable = true;
        windows.username = "wdixon";
      };
    };
  };
}