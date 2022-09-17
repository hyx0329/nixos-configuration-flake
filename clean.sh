nix-env --delete-generations old --profile /nix/var/nix/profiles/system
nix-env --delete-generations old --profile /nix/var/nix/profiles/per-user/*/home-manager

if [ "$1" = "gc" ]; then
  nix-store --gc
fi

