{ ... }: {

  programs.zsh = {
    enable = true;
    shellAliases = {
      nixs =
        "/run/current-system/sw/bin/darwin-rebuild switch --flake ~/darwin/.#personal";
    };
    initExtra = ''
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
         . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi

      autoload -Uz vcs_info
      precmd() { vcs_info }
      zstyle ':vcs_info:git:*' formats '%b '

      setopt PROMPT_SUBST
      PROMPT="%F{blue}%~%f %F{yellow}"\$\{vcs_info_msg_0_}"%f$ "
      RPROMPT=""
    '';
  };
}
