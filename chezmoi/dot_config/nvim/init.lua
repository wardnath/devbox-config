local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "
-- Same for `maplocalleader`
vim.g.maplocalleader = "\\"

require('lazy').setup({
  {'neovim/nvim-lspconfig'},
  {'ms-jpq/coq_nvim', branch = 'coq'},
  {
    'huggingface/llm.nvim',
    opts = {
      model = "tinyllama:latest",
      url = "http://localhost:11434", -- llm-ls uses "/api/generate"
      request_body = {
        options = {
          temperature = 0.2,
          top_p = 0.95,
        }
      }
    }
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },  -- Catppuccin theme
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
})

vim.g.copilot_no_tab_map = true
vim.g.coq_settings = { auto_start = 'shut-up' }

-- Catppuccin theme configuration
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = true, -- sets terminal colors (e.g., `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})

-- Apply the Catppuccin theme
vim.cmd.colorscheme "catppuccin"
