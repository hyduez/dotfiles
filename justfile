symlink:
  ./scripts/symlink.sh

cc:
  xbps-remove -Oo

gc:
  nix-collect-garbage -d
