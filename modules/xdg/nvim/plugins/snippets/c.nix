{ ... }: {
  programs.nixvim.extraConfigLuaPost = ''
    local snippet_collection = require("luasnip.session.snippet_collection")
    snippet_collection.clear_snippets("c")

    local l = require("luasnip")
    local extras = require("luasnip.extras")
    local s = l.snippet

    local fmt = require("luasnip.extras.fmt").fmt
    local rep = extras.rep
    local i = l.insert_node


    l.add_snippets("c", {
      s("ch", fmt([[
      #ifndef {}
      #define {}
        {}
      #endif
      ]], { i(1), rep(1), i(0) }))
    })
  '';
}
