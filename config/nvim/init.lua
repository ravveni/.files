-- General
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.winborder = "rounded"
vim.opt.wrap = false

vim.opt.updatetime = 250

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- LSP
vim.lsp.enable({
  "clangd",
  "lua_ls",
  "pyright",
  "rust_analyzer",
  "ts_ls"
})
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = { -- stops warnings in nvim config
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
})
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client ~= nil then
      if client:supports_method('textDocument/completion') then
        vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      end
    end
  end,
})
vim.cmd("set completeopt+=noselect")

-- Plugins
require("config.lazy")

-- Keymap
local map = vim.keymap.set
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list'})
map('n', '<leader>e', ":Oil<CR>")
map('n', '<leader>f', ":Telescope find_files<CR>")
map('n', '<leader>lf', vim.lsp.buf.format)
map('n', '<leader>z', ":ZenMode<CR>")
