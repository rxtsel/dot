require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } }) -- Load snippets from my-snippets folder
require("luasnip.loaders.from_vscode").lazy_load()
