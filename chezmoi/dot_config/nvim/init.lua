--[[
  Fixed init.lua with the fast-cursor-move plugin properly configured and keymaps moved inside its config function.

  Explanation:
    - When "event = 'VeryLazy'" is used, the plugin won't be loaded immediately.
      If we place keymaps using require("fast-cursor-move") at the bottom of init.lua, 
      Neovim will error out because the plugin module hasn't actually loaded yet.
    - The fix is to define those keymaps inside the plugin's config block (or remove "event" 
      so that the plugin loads earlier). This consolidated approach ensures the plugin is 
      already loaded when we set up our keymaps.

  References:
    - fast-cursor-move.nvim official repo: https://github.com/xiyaowong/fast-cursor-move.nvim
    - lazy.nvim usage docs: https://github.com/folke/lazy.nvim
]]--
-- -- Lazy.nvim setup: Automatically installs and sets up Lazy.nvim if not present
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

-- Leader keys setup: Set `mapleader` and `maplocalleader` before lazy to ensure mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Lazy.nvim plugins setup
require('lazy').setup({
  -- LSP configuration
  {'neovim/nvim-lspconfig'},

  -- COQ completion framework
  {'ms-jpq/coq_nvim', branch = 'coq'},
  {'github/copilot.vim'},

  ---------------------------------------
  -- Enhanced Cursor and Motion Plugins --
  ---------------------------------------
  {
    "xiyaowong/fast-cursor-move.nvim",
    event = "VeryLazy",  -- load lazily
    config = function()
      -- Fast cursor movement plugin setup
      require("fast-cursor-move").setup({
        acceleration = true,  -- Enable acceleration for faster movement
        fast_step = 3,        -- Move 3 lines per keystroke when accelerating
        slow_step = 1,        -- Normal speed: move 1 line per keystroke
        timeout = 1000,       -- Timeout (ms) before resetting to normal speed
      })

      -- Keymaps must be placed here so they won't error prior to loading the plugin
      vim.keymap.set('n', 'j', function()
        require("fast-cursor-move").move("j")
      end, { noremap = true, silent = true })

      vim.keymap.set('n', 'k', function()
        require("fast-cursor-move").move("k")
      end, { noremap = true, silent = true })

      vim.keymap.set('n', 'h', function()
        require("fast-cursor-move").move("h")
      end, { noremap = true, silent = true })

      vim.keymap.set('n', 'l', function()
        require("fast-cursor-move").move("l")
      end, { noremap = true, silent = true })
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

  -- Catppuccin theme setup
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Which-key configuration
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

-- Disable Copilot tab mapping
-- vim.g.copilot_no_tab_map = true

-- COQ settings
vim.g.coq_settings = { auto_start = 'shut-up' }

-- Catppuccin theme configuration
require("catppuccin").setup({
  flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  show_end_of_buffer = false,
  term_colors = true,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false,
  no_bold = false,
  no_underline = false,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
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

