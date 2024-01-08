  return {
    "zbirenbaum/copilot.lua",
    cmd = {"Copilot"},
    opts = {
      suggestion = { enabled = true, auto_trigger = true, keymap = { accept = "<C-j>" } },
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4,
        },
      },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  }
