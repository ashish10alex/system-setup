local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
}

M.config = function()
	local cmp = require("cmp")
	vim.opt.completeopt = { "menu", "menuone", "noselect" }

	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<Tab>"] = cmp.mapping(
                function(fallback)
                    if cmp.visible()
                        then cmp.select_next_item()
                    elseif vim.fn["vsnip#available"](1) == 1 
                        then feedkey("<Plug>(vsnip-expand-or-jump)", "")
                    elseif has_words_before()
                        then cmp.complete()
                    else fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                    end
                    end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(
                function()
                    if cmp.visible()
                        then cmp.select_prev_item()
                    elseif vim.fn["vsnip#jumpable"](-1) == 1
                    then feedkey("<Plug>(vsnip-jump-prev)", "")
                end
                end, { "i", "s" }),
            }),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" }, -- For luasnip users.
		}, {
			{ name = "buffer" },
			{ name = "path" },
		}),
	})
	-- cmp.setup.cmdline(":", { -- DONOT LIKE THIS AS OF NOW
	-- 	mapping = cmp.mapping.preset.cmdline(),
	-- 	sources = cmp.config.sources({
	-- 		{ name = "path" },
	-- 	}, {
	-- 		{ name = "cmdline" },
	-- 	}),
	-- })
end

return M

