--------------------------------------------------------------------------------
-- Direct integration of "fast-cursor-move" logic without using Lazy
-- Place this entire content in your init.lua (or equivalent Neovim config file).
--------------------------------------------------------------------------------

-- Options:
--   vim.g.fast_cursor_move_acceleration -> false to disable acceleration

local fn = vim.fn
local api = vim.api

local ACCELERATION_LIMIT = 150
local ACCELERATION_TABLE_VERTICAL = { 7, 14, 20, 26, 31, 36, 40 }
local ACCELERATION_TABLE_HORIZONTAL = { 10, 15, 20 }

if vim.g.vscode then
  ACCELERATION_TABLE_VERTICAL = { 7, 14, 20, 26 }
end

---VSCode's cursorMove
---@param direction "j" | "k"
---@param step integer
---@return string
local function vscode_move(direction, step)
  local to, by
  if direction == "j" then
    to = "down"
    by = "wrappedLine"
  elseif direction == "k" then
    to = "up"
    by = "wrappedLine"
  else
    return step .. direction
  end
  fn.VSCodeNotify("cursorMove", { to = to, by = by, value = step })
  return "<esc>"
end

local get_move_step = (function()
  local prev_direction
  local prev_time = 0
  local move_count = 0
  return function(direction)
    if vim.g.fast_cursor_move_acceleration == false then
      return 1
    end

    if direction ~= prev_direction then
      prev_time = 0
      move_count = 0
      prev_direction = direction
    else
      local time = vim.loop.hrtime()
      local elapsed = (time - prev_time) / 1e6
      if elapsed > ACCELERATION_LIMIT then
        move_count = 0
      else
        move_count = move_count + 1
      end
      prev_time = time
    end

    local acceleration_table = (
      (direction == "j" or direction == "k") and ACCELERATION_TABLE_VERTICAL or ACCELERATION_TABLE_HORIZONTAL
    )
    for idx, count in ipairs(acceleration_table) do
      if move_count < count then
        return idx
      end
    end
    return #acceleration_table
  end
end)()

---@param direction "h" | "j" | "k" | "l"
---@return "h" | "gj" | "gk" | "l"
local function get_move_chars(direction)
  if direction == "j" then
    return "gj"
  elseif direction == "k" then
    return "gk"
  else
    return direction
  end
end

local function move(direction)
  local move_chars = get_move_chars(direction)
  if fn.reg_recording() ~= "" or fn.reg_executing() ~= "" then
    return move_chars
  end
  local is_normal = api.nvim_get_mode().mode:lower() == "n"
  local use_vscode = vim.g.vscode and is_normal and direction ~= "h" and direction ~= "l"
  if vim.v.count > 0 then
    if use_vscode then
      return vscode_move(direction, vim.v.count)
    else
      return move_chars
    end
  end
  local step = get_move_step(direction)
  if use_vscode then
    return vscode_move(direction, step)
  else
    return step .. move_chars
  end
end

local function setup_fast_cursor_move()
  for _, motion in ipairs({ "h", "j", "k", "l" }) do
    vim.keymap.set({ "n", "v" }, motion, function()
      return move(motion)
    end, { expr = true })
  end
end

vim.defer_fn(setup_fast_cursor_move, 500)


--------------------------------------------------------------------------------
-- Lazy.nvim and other plugin configurations
--------------------------------------------------------------------------------

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

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  -- REMOVE fast-cursor-move plugin entry since we embedded it directly above.

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

vim.g.coq_settings = { auto_start = 'shut-up' }

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

vim.cmd.colorscheme("catppuccin")

