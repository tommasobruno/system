{ ... }: {
  programs.wezterm = {
    enable = true;

    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = {}
      local mux = wezterm.mux

      wezterm.on("gui-startup", function()
        local tab, pane, window = mux.spawn_window(cmd or {})
        window:gui_window():maximize()
      end)

      if wezterm.config_builder() then
        config = wezterm.config_builder()
      end

      config.colors = {}
      config.colors.background = '#111111'
      config.keys = {
        {
          key = 'k',
          mods = 'CMD',
          action = wezterm.action.ClearScrollback 'ScrollbackAndViewport'
        }
      }

      config.font = wezterm.font("Iosevka NFM")
      config.font_size = 15
      config.use_fancy_tab_bar = false
      config.send_composed_key_when_left_alt_is_pressed = true
      config.send_composed_key_when_right_alt_is_pressed = true

      config.enable_scroll_bar = false
      config.tab_bar_at_bottom = true
      config.freetype_load_target = "HorizontalLcd"

      return config
    '';
  };
}
