{ pkgs, ... }: {

  fonts = {
    fontDir.enable = true;
    fonts = [ (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];
  };

  programs.zsh.enable = true;
  environment = { shells = [ pkgs.zsh ]; systemPackages = with pkgs; [ vim ]; };

  imports = [ ./config ];
}
