-- local current_buffer_name = vim.fn.expand("%:t")
-- print("sourcing " .. current_buffer_name .. " at " .. os.date("%X"))

-- how to get the name of the file in current buffer in lua neovim?
require("mason").setup()
require("mason-lspconfig").setup()
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
  -- add any options here, or leave empty to use the default settings
})


-- Set up lspconfig.
local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "L", vim.lsp.buf.signature_help, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "]e", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "qe", vim.diagnostic.setqflist, {buffer=0})
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {buffer=0})
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            severity_sort = { reverse = false }
        }
    )
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  -- vim.lsp.handlers.signature_help, {
  --     silent = true,
  --     focusable = false
  --       }
  --   )
end

require 'lspconfig'.pyright.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

-- require'lspconfig'.pylsp.setup{
--   capabilities = capabilities,
--   on_attach = on_attach,
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle =  { enabled = false },
--         pylsp_mypy = { enabled = true },
--         isort = { enabled = false, profile = "black" },
--         pylint = { enabled = false, executable = "pylint" },
--       }
--     }
--   }
-- }


require'lspconfig'.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require'lspconfig'.terraformls.setup{}
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

require 'lspconfig'.tflint.setup{}

require 'lspconfig'.bashls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

require 'lspconfig'.lua_ls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
          }
        }
      }
    }
}


require 'lspconfig'.ocamllsp.setup{
  filetypes = { "ocaml",  "ml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
  root_dir = lspconfig.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
  on_attach = on_attach,
  capabilities = capabilities
}


local grep_args = { '--hidden' }
require('telescope').setup {
  defaults = {
    prompt_prefix = "> ",
    file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
		"%rpdf", "%.mkv", "%.mp4", "%.zip", "node_modules", "yarn.lock"},
  },
  pickers = {
    find_files = {
      hidden = true,
      git_ignore = false,
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
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        n = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
}

require('telescope').load_extension('env')
require('telescope').load_extension('fzf')

vim.opt.completeopt={"menu", "menuone", "noselect"}

  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    -- snippet = {
    --   expand = function(args)
    --      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --   end,
    -- },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    completion = {
              -- autocomplete = true,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

      -- Use tab and shit tab for autocompletion
	  ["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
		  cmp.select_next_item()
		elseif vim.fn["vsnip#available"](1) == 1 then
		  feedkey("<Plug>(vsnip-expand-or-jump)", "")
		elseif has_words_before() then
		  cmp.complete()
		else
		  fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
		end
	  end, { "i", "s" }),

	  ["<S-Tab>"] = cmp.mapping(function()
		if cmp.visible() then
		  cmp.select_prev_item()
		elseif vim.fn["vsnip#jumpable"](-1) == 1 then
		  feedkey("<Plug>(vsnip-jump-prev)", "")
		end
	  end, { "i", "s" }),

    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
       { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

vim.keymap.set('i', '<M-.>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<M-,>', '<Plug>(copilot-previous)')

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
   textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
    }
  }
}

require'treesitter-context'.setup{}

require'toggleterm'.setup {
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  direction='float'
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal
local ipython3 = Terminal:new({ cmd ="python3", hidden = true, direction='horizontal'})

function _ipython3_toggle()
  ipython3:toggle()
end

local Terminal  = require('toggleterm.terminal').Terminal
local htop = Terminal:new({ cmd ="htop", hidden = true, direction='float'})
function _htop_toggle()
  htop:toggle()
end


require("zen-mode").setup({
    window = {
          width = 0.50,
        }
})

require("notify").setup({})

lspconfig.rust_analyzer.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

require'sniprun'.setup({
  -- display = { "LongTempFloatingWindow" },
  -- display = { "Classic"},
  -- display = { "VirtualTextOk", "VirtualTextErr" },
})

-- then setup your lsp server as usual
local lspconfig = require('lspconfig')
-- example to setup lua_ls and enable call snippets
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


-- Make sure exec_between_quoutes is sourced whhen opening a new window in neovim
vim.cmd("autocmd BufEnter * luafile ~/.config/nvim/lua/execute_bigquery.lua")

-- Rounded borders for signature help, hover and diagnostic
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
                border = 'rounded',
                close_events = {"BufHidden", "InsertLeave"},
    }
)
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                border = 'rounded',
    }
)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline    = false,
        virtual_text = true,
        float = { border = "rounded" }, 
    }
)

--debugging using DAP
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F1>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F3>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<F6>", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F7>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")

-- require("nvim-dap-virtual-text").setup()
require('dap-python').setup('/Users/ashishalex/Documents/work/jlr/venvs/jlrenv/bin/python3')

require('dapui').setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

function read_file(path)
  local file = io.open(path, "rb") 
  if not file then return nil end
  local content = file:read "*a" -- *a or *all reads the whole file
  file:close()
  return content
end

local compile_dataform = function()
    local dataform_compile_cmd_path = os.getenv("HOME") .. "/.config/nvim/lua/dataform_compile_cmd.txt"
    local dataform_compile_cmd = read_file(dataform_compile_cmd_path)
    local output = vim.fn.system(dataform_compile_cmd)
    print("Compiled dataform output to /tmp/temp.sqlx")
end


vim.api.nvim_create_user_command("CompileDataform", compile_dataform, {})


require("git-worktree").setup({})

-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 50,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

-- override the following default highlight groups for ease of viewing of merge conflicts
vim.cmd("highlight DiffAdd guibg = '#405d7e'")
vim.cmd("highlight DiffText guibg = '#314753'")

require'git-conflict'.setup {
  {
  default_mappings = true, -- disable buffer local mapping created by this plugin
  default_commands = true, -- disable commands created by this plugin
  disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
  list_opener = 'copen', -- command or function to open the conflicts list
  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = 'DiffAdd',
    current  = 'DiffText',
  },
  }
}

vim.api.nvim_create_autocmd('User', {
  pattern = 'GitConflictDetected',
  callback = function()
    vim.notify('Conflict detected in file '..vim.api.nvim_buf_get_name(0))
    vim.cmd('LspStop')
  end
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'GitConflictResolved',
  callback = function()
    vim.cmd('LspRestart')
  end
})



-- require('rose-pine').setup({})
-- vim.cmd('colorscheme rose-pine')
--
--

  -- require'lspconfig'.gopls.setup()
  -- require "lsp_signature".setup({
  --   bind = true, -- This is mandatory, otherwise border config won't get registered.
  --   hint_prefix="",
  --   hint_enable=false,
  --   handler_opts = {
  --     border = "rounded",
  --   }
  -- })


require('log-highlight').setup({
    pattern = '*.txt'
  })


