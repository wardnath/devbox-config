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
  -- Original mappings for hjkl
  for _, motion in ipairs({ "h", "j", "k", "l" }) do
    vim.keymap.set({ "n", "v" }, motion, function()
      return move(motion)
    end, { expr = true })
  end
  
  -- Add arrow key mappings
  local arrow_to_motion = {
    ["<Up>"] = "k",
    ["<Down>"] = "j",
    ["<Left>"] = "h",
    ["<Right>"] = "l"
  }
  
  for arrow, motion in pairs(arrow_to_motion) do
    vim.keymap.set({ "n", "v" }, arrow, function()
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
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Add whitespace visualization settings
vim.opt.list = true
vim.opt.listchars = {
  space = '·',
  tab = '→ ',
  trail = '•',
  extends = '⟩',
  precedes = '⟨',
  nbsp = '␣',
}

require("lazy").setup({
 -- File Explorer that supplements but doesn't replace Netrw
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     -- Keep Netrw enabled
  --     vim.g.loaded_netrw = 0
  --     vim.g.loaded_netrwPlugin = 0
      
  --     require("nvim-tree").setup({
  --       disable_netrw = false,       -- Don't disable Netrw
  --       hijack_netrw = false,        -- Don't hijack Netrw windows
  --       hijack_directories = {
  --         enable = false,            -- Don't hijack directories
  --         auto_open = false,         -- Don't automatically open on directory arguments
  --       },        
  --     open_on_tab = false,
  --     hijack_unnamed_buffer_when_opening = false,
  --       hijack_cursor = false,       -- Keep cursor behavior consistent
  --       update_cwd = false,          -- Don't change working directory
  --       actions = {
  --         open_file = {
  --           quit_on_open = true,     -- Close the tree when opening a file
  --         },
  --       },
  --       view = {
  --         width = 30,
  --         side = "left",
  --       },
  --       renderer = {
  --         group_empty = true,        -- Compact folders that contain only a single folder
  --       },
  --     })
      
  --     -- Use different keymaps for Netrw and nvim-tree to avoid confusion
  --     vim.keymap.set('n', '<leader>e', '<cmd>Lexplore<CR>', { desc = 'Toggle Netrw file explorer' })
  --     vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
  --   end
  -- },
  -- Telescope - fuzzy finder that enhances but doesn't replace built-in search
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
          path_display = { "truncate" }
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
          }
        }
      })
      
      -- Load fzf extension if available
      pcall(function() require("telescope").load_extension("fzf") end)
      
      -- Key mappings that coexist with built-in search
      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
    end
  },
  -- Comment plugin with intuitive keybindings
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        -- Use familiar gc operator (similar to built-in formatting operators)
        toggler = { line = 'gcc', block = 'gbc' },
        opleader = { line = 'gc', block = 'gb' },
      })
    end
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
  {
    "tpope/vim-sleuth",
    event = "BufReadPre",
  },
  {
    "ntpeters/vim-better-whitespace",
    event = "VeryLazy",
    config = function()
      -- Enable highlighting of whitespace by default
      vim.g.better_whitespace_enabled = 1
      -- Enable stripping whitespace on save
      vim.g.strip_whitespace_on_save = 1  -- Changed from 0 to 1 to auto-strip on save
      vim.g.strip_whitespace_confirm = 0  -- No confirmation needed
      -- Show spaces and tabs
      vim.g.better_whitespace_filetypes_blacklist = {}
      -- Show tabs as well
      vim.g.show_spaces_that_precede_tabs = 1
      -- Use a distinct color for whitespace highlighting
      vim.g.better_whitespace_ctermcolor = 'gray'
      vim.g.better_whitespace_guicolor = '#222222'
      -- Highlight all whitespace, not just trailing
      vim.g.better_whitespace_operator = ''
    end,
  },
  -- Add autosave plugin
  {
    "Pocco81/auto-save.nvim",
    event = "VeryLazy",
    config = function()
      require("auto-save").setup({
        enabled = true,
        execution_message = {
          message = function() return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S")) end,
          dim = 0.18,
          cleaning_interval = 1250,
        },
        trigger_events = {"InsertLeave", "TextChanged"},
        write_all_buffers = false,
        debounce_delay = 135,
        condition = function(buf)
          local fn = vim.fn
          -- don't save for special buffers
          if fn.getbufvar(buf, "&filetype") == "TelescopePrompt" then
            return false
          end
          if fn.getbufvar(buf, "&filetype") == "" then
            return false
          end
          if fn.getbufvar(buf, "&modifiable") == 0 then
            return false
          end
          
          return true
        end
      })
    end,
  },

  -- Add statusline plugin (lualine)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      local custom_catppuccin = require('lualine.themes.catppuccin')
      -- Customize the theme if needed
      -- custom_catppuccin.normal.a.bg = '#89b4fa' 

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = custom_catppuccin, -- Use the catppuccin theme
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = true, -- Uses a single statusline for all windows
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { 
            "branch",
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
            },
          },
          lualine_c = { 
            {
              "filename",
              path = 1, -- Show relative path
              symbols = {
                modified = "[+]",
                readonly = "[RO]",
                unnamed = "[No Name]",
              }
            }
          },
          lualine_x = {
            { 
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
            },
            {
              function()
                -- Show auto-save status if enabled
                return vim.g.auto_save_state and "󰆓 AS" or ""
              end,
              color = { fg = "#E06C75" }
            },
            {
              function()
                -- Show cursor position in file (percentage)
                local current_line = vim.fn.line(".")
                local total_lines = vim.fn.line("$")
                local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
                local line_ratio = current_line / total_lines
                local index = math.ceil(line_ratio * #chars)
                return chars[index]
              end,
              color = { fg = "#89B4FA" }
            },
            "encoding",
            "fileformat",
            "filetype"
          },
          lualine_y = { "progress" },
          lualine_z = { "location" }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = { "nvim-tree", "fugitive" }
      })
    end
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
    -- Remove lualine integration from here
  },
})

vim.cmd.colorscheme("catppuccin")

-- Add keymaps for whitespace toggling
vim.keymap.set('n', '<leader>sw', '<cmd>ToggleWhitespace<CR>', { desc = 'Toggle whitespace visibility' })
vim.keymap.set('n', '<leader>ss', '<cmd>StripWhitespace<CR>', { desc = 'Strip trailing whitespace' })

-- Add keymap for toggling autosave
vim.keymap.set('n', '<leader>at', '<cmd>ASToggle<CR>', { desc = 'Toggle autosave functionality' })

-- Set up a keymap to toggle the statusline if needed
vim.keymap.set('n', '<leader>st', function()
  vim.opt.laststatus = vim.opt.laststatus:get() == 0 and 2 or 0
end, { desc = 'Toggle statusline visibility' })
