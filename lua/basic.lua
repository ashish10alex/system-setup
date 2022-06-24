-- print('hello from ~/config/nvim/lua/basic.lua')
require("nvim-lsp-installer").setup {}
require 'lspconfig'.pyright.setup{}
require 'lspconfig'.bashls.setup{}
require 'lspconfig'.sumneko_lua.setup{}
require 'lspconfig'.sqlls.setup{}
-- require 'lspconfig'.csharp_ls.setup{}

--
-- Add here to change telescope settings
require('telescope').setup{
    defaults = {
        prompt_prefix = "> "
    }
}
require('telescope').load_extension('fzf')


