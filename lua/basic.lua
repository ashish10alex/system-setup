-- print('hello from ~/config/nvim/lua/basic.lua')
require("nvim-lsp-installer").setup {}
require 'lspconfig'.pyright.setup{
    on_attach = function()
    vim.keymap.set("n", "gl", vim.lsp.buf.definition, {bufffer=0})
end,
}
require 'lspconfig'.bashls.setup{}
require 'lspconfig'.sumneko_lua.setup{}
require 'lspconfig'.csharp_ls.setup{}



