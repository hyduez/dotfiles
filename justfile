gc-sudo:
  # garbage collect all unused nix store entries
  sudo -H nix-collect-garbage -d

gc:
  nix-collect-garbage -d
