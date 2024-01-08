-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "

-- Enable exhaustive tab completion
vim.o.wildmode = "longest,list,full"
vim.o.wildmenu = true

-- Ignore files
vim.opt.wildignore = {
  "*.pyc",
  "*_build/*",
  "**/coverage/*",
  "**/node_modules/*",
  "**/android/*",
  "**/ios/*",
  "**/.git/*",
}

vim.o.errorbells = false  -- Disable error bells
vim.o.scrolloff = 10     -- Smooth scrolling at the bottom
vim.o.spell = true       -- Enable spell checking
vim.o.spelllang = "en_us" -- Set spell checking language
vim.o.encoding = "utf-8"  -- Set internal encoding to UTF-8
vim.o.hidden = true       -- Allow switching buffers without saving
vim.o.backup = false      -- Disable backup files
vim.o.writebackup = false -- Disable writebackup files
vim.o.syntax = "on"       -- Enable syntax highlighting
vim.o.relativenumber = true -- Enable relative line numbers
vim.o.textwidth = 120     -- Set text width to 120 characters
vim.o.updatetime = 30     -- Set update time to 30 milliseconds
vim.o.termguicolors = true -- Enable true color support
vim.o.tabstop = 4        -- Set tab stop to 4 spaces
vim.o.softtabstop = 4    -- Set soft tab stop to 4 spaces
vim.o.shiftwidth = 4     -- Set shift width to 4 spaces
vim.o.expandtab = true   -- Expand tabs to spaces
vim.o.smartindent = true -- Enable smart indentation
vim.o.number = true      -- Enable line numbering
vim.o.smartcase = true   -- Enable smart case search
vim.o.incsearch = true   -- Enable incremental search
vim.o.hlsearch = true    -- Enable highlight search
vim.o.ignorecase = true  -- Enable case-insensitive search
vim.o.foldmethod = "indent" -- Set folding method to indent
vim.o.foldlevel = 99     -- Set initial fold level to 99 (closed)
vim.cmd("highlight Comment cterm=italic") -- Highlight comments in italics
