
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
      model = "codegemma:2b-code-q2_K",
      url = "http://localhost:11434", -- llm-ls uses "/api/generate"
      -- api_token = nil, -- cf Install paragraph
      -- model = "bigcode/starcoder2-15b", -- the model ID, behavior depends on backend
      -- backend = "huggingface", -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
      -- url = nil, -- the http url of the backend
      -- tokens_to_clear = { "<|endoftext|>" }, -- tokens to remove from the model's output
      -- parameters that are added to the request body, values are arbitrary, you can set any field:value pair here it will be passed as is to the backend
      -- request_body = {
      --    parameters = {
      --      max_new_tokens = 60,
      --      temperature = 0.2,
      --      top_p = 0.95,
      --    },
      --  },
      -- set this if the model supports fill in the middle
      fim = {
        enabled = true,
        prefix = "<fim_prefix>",
        middle = "<fim_middle>",
        suffix = "<fim_suffix>",
      },
      -- debounce_ms = 150,
      -- accept_keymap = "<Tab>",
      -- dismiss_keymap = "<S-Tab>",
      -- tls_skip_verify_insecure = false,
      -- llm-ls configuration, cf llm-ls section
      -- sp = {
      --  bin_path = nil,
      --  host = nil,
      --  port = nil,
      --cmd_env = nil, -- or { LLM_LOG_LEVEL = "DEBUG" } to set the log level of llm-ls
      --version = "0.5.3",
      --},
      --tokenizer = nil, -- cf Tokenizer paragraph
      --context_window = 1024, -- max number of tokens for the context window
      --enable_suggestions_on_startup = true,
      --enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
      --disable_url_path_completion = false, -- cf Backend
      request_body = {
	-- prompt=f'<|fim_prefix|>{prefix}<|fim_suffix|>{suffix}<|fim_middle|>',
        options = {
          temperature = 0.01,
          top_p = 0.9,
	  num_predict: 128,
          stop: ["<|file_separator|>"],
        }
      }
    }
  },
  {
  }
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


