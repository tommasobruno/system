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

            config.force_reverse_video_cursor = true
            config.colors = {
      	      foreground = "#dcd7ba",
      	      background = "#1f1f28",
              cursor_bg = "#c8c093",
      	      cursor_fg = "#c8c093",
      	      cursor_border = "#c8c093",
      	      selection_fg = "#c8c093",
      	      selection_bg = "#2d4f67",
      	      scrollbar_thumb = "#16161d",
      	      split = "#16161d",
      	      ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
      	      brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
      	      indexed = { [16] = "#ffa066", [17] = "#ff5d62" }
            }

            config.keys = {
              {
                key = 'k',
                mods = 'CMD',
                action = wezterm.action.ClearScrollback 'ScrollbackAndViewport'
              }
            }

            config.window_background_image = '/Users/tommasobruno/darwin/modules/home/wallpapers/resident-envil-claire.jpeg'
            config.window_background_image_hsb = {
              -- Darken the background image by reducing it to 1/3rd
              brightness = 0.03,

              -- You can adjust the hue by scaling its value.
              -- a multiplier of 1.0 leaves the value unchanged.
              hue = 1,

              -- You can adjust the saturation also.
              saturation = 0.5,
            }

            config.window_background_opacity = 0.7
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
