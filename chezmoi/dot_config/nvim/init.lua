--[[
  Full init.lua configuration demonstrating how to properly load fast-cursor-move.nvim.
  Minimal commentary is inlined for clarity.
  References:
    [1] https://github.com/xiyaowong/fast-cursor-move.nvim
    [2] https://github.com/folke/lazy.nvim
    [3] https://stackoverflow.com/questions/63674334/how-to-move-page-and-half-page-in-neovim-default-key-is-not-working-for-me
    ...
]]

-- Automatically install lazy.nvim if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader keys must be set before calling lazy
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Lazy setup
require("lazy").setup({
  {
    -- fast-cursor-move plugin
    "xiyaowong/fast-cursor-move.nvim",
    event = "VeryLazy",
    config = function()
      require("fast-cursor-move").setup({
        acceleration = true,
        fast_step = 3,
        slow_step = 1,
        timeout = 1000,
      })
      vim.keymap.set('n', 'j', function() require("fast-cursor-move").move("j") end, { noremap = true, silent = true })
      vim.keymap.set('n', 'k', function() require("fast-cursor-move").move("k") end, { noremap = true, silent = true })
      vim.keymap.set('n', 'h', function() require("fast-cursor-move").move("h") end, { noremap = true, silent = true })
      vim.keymap.set('n', 'l', function() require("fast-cursor-move").move("l") end, { noremap = true, silent = true })
    end,
  },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup()
    end,
  },
  -- Additional plugins
  { "neovim/nvim-lspconfig" },
  { "ms-jpq/coq_nvim", branch = "coq" },
  { "github/copilot.vim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function() require("which-key").show({ global = false }) end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
})

-- COQ settings
vim.g.coq_settings = { auto_start = 'shut-up' }

-- Theme config
require("catppuccin").setup({
  flavour = "mocha",
  background = { light = "latte", dark = "mocha" },
  transparent_background = false,
  show_end_of_buffer = false,
  term_colors = true,
  dim_inactive = { enabled = false, shade = "dark", percentage = 0.15 },
  no_italic = false,
  no_bold = false,
  no_underline = false,
  styles = { comments = { "italic" }, conditionals = { "italic" } },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = { enabled = true, indentscope_color = "" },
  },
})

-- Apply Catppuccin theme
vim.cmd.colorscheme("catppuccin")

