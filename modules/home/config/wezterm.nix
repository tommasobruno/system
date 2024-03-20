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

      config.keys = {
        {
          key = 'k',
          mods = 'CMD',
          action = wezterm.action.ClearScrollback 'ScrollbackAndViewport'
        }
      }

      config.window_background_image = '/Users/tommasobruno/darwin/modules/home/butterfly.jpg'
      config.window_background_image_hsb = {
        -- Darken the background image by reducing it to 1/3rd
        brightness = 0.03,

        -- You can adjust the hue by scaling its value.
        -- a multiplier of 1.0 leaves the value unchanged.
        hue = 1,

        -- You can adjust the saturation also.
        saturation = 0.5,
      }

      config.window_background_opacity = 1
      config.font = wezterm.font("JetBrains Mono")
      config.font_size = 13
      config.use_fancy_tab_bar = false
      config.send_composed_key_when_left_alt_is_pressed = true
      config.send_composed_key_when_right_alt_is_pressed = true

      config.enable_scroll_bar = false
      config.window_padding = {
        left = 20,
        right = 20,
        top = 20,
        bottom = 20
      }

      config.tab_bar_at_bottom = true
      config.freetype_load_target = "HorizontalLcd"

      return config
    '';
  };
}
