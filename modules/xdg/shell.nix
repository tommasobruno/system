{ ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      nixs =
        "/run/current-system/sw/bin/darwin-rebuild switch --flake ~/system/.#personal";
      nd = "nix develop";
    };
    initExtra = ''
      autoload -Uz vcs_info
      precmd() { vcs_info }
      zstyle ':vcs_info:git:*' formats '%b '

      RPROMPT=""
      setopt PROMPT_SUBST

      # Detect if in nix-shell
      if [[ -n "$IN_NIX_SHELL" ]]; then
        # Customize the prompt for nix-shell
       PROMPT="%F{red}(nix-shell)%f %F{blue}%~%f %F{yellow}"\$\{vcs_info_msg_0_}"%f$ "
      else
       PROMPT="%F{blue}%~%f %F{yellow}"\$\{vcs_info_msg_0_}"%f$ "
      fi
    '';
  };
}
