
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

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`


require('lazy').setup({
  {'neovim/nvim-lspconfig'},
  {'ms-jpq/coq_nvim', branch = 'coq'},
  {'github/copilot.vim'}
})

vim.g.copilot_no_tab_map = true
vim.g.coq_settings = { auto_start = 'shut-up' }

