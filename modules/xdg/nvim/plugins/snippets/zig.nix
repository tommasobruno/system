{ ... }: {
  programs.nixvim.extraConfigLuaPost = ''
    local snippet_collection = require("luasnip.session.snippet_collection")
    snippet_collection.clear_snippets("zig")

    local l = require("luasnip")
    local extras = l.extras
    local s = l.snippet

    local fmt = extras.fmt.fmt
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
