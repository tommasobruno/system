{ ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      nixs =
        "/run/current-system/sw/bin/darwin-rebuild switch --flake ~/system/.#personal";
    };
    initExtra = ''
      autoload -Uz vcs_info
      precmd() { vcs_info }
      zstyle ':vcs_info:git:*' formats '%b '

      setopt PROMPT_SUBST
      PROMPT="%F{blue}%~%f %F{yellow}"\$\{vcs_info_msg_0_}"%f$ "
      RPROMPT=""
    '';
  };
}
