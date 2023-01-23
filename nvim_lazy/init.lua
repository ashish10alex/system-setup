local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	"folke/which-key.nvim",
	-- Automatically install LSPs to stdpath for neovim
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	-- Useful status updates for LSP
	'j-hui/fidget.nvim',
	-- Additional lua configuration, makes nvim stuff amazing
	'folke/neodev.nvim',
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	{"catppuccin/nvim", name = "catppuccin"},
	"folke/zen-mode.nvim",
	"tpope/vim-surround",
	"nvim-lua/plenary.nvim",
	'L3MON4D3/LuaSnip',
	{
		"nvim-telescope/telescope.nvim",
		 keys = {
			 {"<leader>f", "<cmd>Telescope find_files<cr>"},
			 {"<leader>gf", "<cmd>Telescope git_files<cr>"},
			 {"<leader>sd", "<cmd>Telescope diagnostics<cr>"},
			 {"<leader>grep", "<cmd>:lua require('telescope.builtin').live_grep()<cr>"},
		 },
		 config = function()
			 local grep_args = { '--hidden' }
		          require("telescope").setup{
				  defaults = {
				    prompt_prefix = "> ",
				    file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
						"%.pdf", "%.mkv", "%.mp4", "%.zip"},
				  },
				  pickers = {
				    find_files = {
				      hidden = true
				    },
				    live_grep = {
				      additional_args = function(opts)
					return grep_args
				      end
				    },
				    grep_string = {
				      additional_args = function(opts)
					return grep_args
				      end
				    },
				  },
			  }
		 end,
	},
	"tpope/vim-commentary", -- commenting - `gcc` for commenting and un-commenting
	"tpope/vim-surround",
	
	-- Treesitter plugins
	"nvim-treesitter/nvim-treesitter",
	-- Enables sticky scroll, i.e shows function name at the top
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-treesitter/playground",
	"inkarkat/vim-ReplaceWithRegister",
	"preservim/nerdtree",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- LSP 
	"williamboman/nvim-lsp-installer",
	"neovim/nvim-lspconfig",
	
	-- Auto completion
	{"hrsh7th/cmp-nvim-lsp"},
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",

	-- Replace words with copied word
	-- Copy the words using - "yiw" (yank inner word)
	-- Go to the word which you want replaced and type "griw" (go replace inner word)
	-- Action as usual is repeatable using "."
	'inkarkat/vim-ReplaceWithRegister',

})

vim.cmd.colorscheme "catppuccin"


require("mapping")
require("language_servers")
