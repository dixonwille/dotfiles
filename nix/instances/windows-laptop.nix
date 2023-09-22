{ config, pkgs, lib, ... }:
{
  imports = [
    ../base
    ../onepassword
    ../neovim
  ];
  config = {
    dixonwille = {
      onepassword = {
        enable = true;
        accounts = {
          my = {
            email = "dixonwille@gmail.com";
          };
        };
      };
    };
    profiles.base = {
      username = "wdixon";
      machine = "winlap";
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
