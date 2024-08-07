{ ... }: {
  programs.nixvim.extraConfigLuaPost = ''
    local snippet_collection = require("luasnip.session.snippet_collection")
    snippet_collection.clear_snippets("zig")

    local l = require("luasnip")
    local extras = require("luasnip.extras")
    local s = l.snippet

    local fmt = require("luasnip.extras.fmt").fmt
    local i = l.insert_node


    l.add_snippets("zig", {
      s("cmpt", fmt([[
      comptime {{
        _ = @import({});
      }}
      ]], { i(1) }))
    })
  '';
}
