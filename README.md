# Systems' configurations

## Requirements
- Install Nix (based on your operating system)
[Installation Guide](https://nixos.wiki/wiki/Nix_Installation_Guide)


## Apple Users
Install Hombrew (if using apple devices)
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install nix-darwin
```shell
nix run nix-darwin -- switch --flake (PATH WHERE YOU CLONED THE REPO)
```

Rebuild flake
```shell
darwin-rebuild switch --flake (PATH WHERE flake.nix is)
```
