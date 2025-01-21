-- Lazy.nvim setup: Automatically installs and sets up Lazy.nvim if not present
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
  -- LLM plugin configuration
  --{
  --  'huggingface/llm.nvim',
  --  opts = {
  --    --model = "smollm:135m", -- Specify model ID
  --    model = "phi3.5:3.8b-mini-instruct-q2_K",
  --    url = "http://localhost:11434",   -- Backend URL
  --    -- api_token = nil, -- cf Install paragraph
  --    -- model = "bigcode/starcoder2-15b", -- the model ID, behavior depends on backend
  --    backend = "ollama", -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
  --    -- url = nil, -- the http url of the backend
  --    -- tokens_to_clear = { "" }, -- tokens to remove from the model's output
  --    -- parameters that are added to the request body, values are arbitrary, you can set any field:value pair here it will be passed as is to the backend
  --    -- request_body = {
  --    --    parameters = {
  --    --      max_new_tokens = 60,
  --    --      temperature = 0.2,
  --    --      top_p = 0.95,
  --    --    },
  --    --  },

  --    --fim = {
  --    --  enabled = true, -- Enable Fill in the Middle (FIM)
  --    --  prefix = "<fim_prefix>",
  --    --  middle = "<fim_middle>",
  --    --  suffix = "<fim_suffix>",
  --    --},
  --    -- debounce_ms = 150,
  --    -- accept_keymap = "<Tab>",
  --    -- dismiss_keymap = "<S-Tab>",
  --    -- tls_skip_verify_insecure = false,
  --    -- llm-ls configuration, cf llm-ls section
  --    -- lsp = {
  --    --   bin_path = nil,
  --    --   host = nil,
  --    --   port = nil,
  --    --   cmd_env = nil, -- or { LLM_LOG_LEVEL = "DEBUG" } to set the log level of llm-ls
  --    --   version = "0.5.3",
  --    -- },
  --    -- tokenizer = nil, -- cf Tokenizer paragraph
  --    -- context_window = 1024, -- max number of tokens for the context window
  --    -- enable_suggestions_on_startup = true,
  --    -- enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
  --    -- disable_url_path_completion = false, -- cf Backend
  --    request_body = {
  --      --prompt = "<|fim_prefix|>{prefix}<|fim_suffix|>{suffix}<|fim_middle|>",
  --      --prompt=f'{prefix}{suffix}',
  --      options = {
  --        temperature = 0.01, -- Sampling temperature
  --        top_p = 0.9 -- Nucleus sampling probability
  --        --num_predict = 128,  -- Number of predictions
  --        -- stop: [""]     -- Stop token
  --      },
  --    }
  --  }
  --},

  
  ---------------------------------------
  -- Enhanced Cursor and Motion Plugins --
  ---------------------------------------
  {
    "xiyaowong/fast-cursor-move.nvim",  -- Fast cursor movement plugin.
    event = "VeryLazy",  -- Load lazily.
    config = function()
      require("fast-cursor-move").setup({
        acceleration = true,  -- Enable acceleration for faster movement.
        fast_step = 3,        -- Move 3 lines per keystroke when accelerating.
        slow_step = 1,        -- Normal speed: move 1 line per keystroke.
        timeout = 1000,       -- Timeout (ms) before resetting to normal speed.
      })
    end,
  },
  {
    "ggandor/leap.nvim",  -- Quick jump motions.
    event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings()  -- Set default keybindings.
    end,
  },
  {
    "karb94/neoscroll.nvim", -- Smooth scrolling plugin.
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup()  -- Use default settings.
    end,
  }


  -- Catppuccin theme setup
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Which-key configuration
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?", -- Show buffer local keymaps
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
})

-- Disable Copilot tab mapping
--vim.g.copilot_no_tab_map = true

-- COQ settings
vim.g.coq_settings = { auto_start = 'shut-up' }

-- Catppuccin theme configuration
require("catppuccin").setup({
  flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false, -- Disable transparent background
  show_end_of_buffer = false,     -- Hide '~' characters after the end of buffers
  term_colors = true,             -- Enable terminal colors
  dim_inactive = {
    enabled = false,              -- Disable dimming inactive windows
    shade = "dark",
    percentage = 0.15,            -- Dimming percentage
  },
  no_italic = false,              -- Allow italics
  no_bold = false,                -- Allow bold
  no_underline = false,           -- Allow underline
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    -- More style customizations can be added here
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

---------------------------------------------------
-- Custom Key Mappings for fast-cursor-move Plugin --
---------------------------------------------------
-- Override default h/j/k/l behavior with fast-cursor-move functions.
vim.keymap.set('n', 'j', function() require("fast-cursor-move").move("j") end, { noremap = true, silent = true })
vim.keymap.set('n', 'k', function() require("fast-cursor-move").move("k") end, { noremap = true, silent = true })
vim.keymap.set('n', 'h', function() require("fast-cursor-move").move("h") end, { noremap = true, silent = true })
vim.keymap.set('n', 'l', function() require("fast-cursor-move").move("l") end, { noremap = true, silent = true })

