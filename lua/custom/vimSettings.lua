vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.spell = true

vim.o.foldmethod = 'indent'
vim.o.foldlevelstart = 99
vim.o.swapfile = false

-- vim.o.autochdir = true - destroys fuzzyfinder

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

vim.o.colorcolumn = "80,110"
vim.o.textwidth = 110
vim.o.formatoptions = "jcroqlt"
vim.o.wrap = true
vim.o.hlsearch = true -- Set highlight on search

vim.wo.number = true  -- Make line numbers default
vim.wo.relativenumber = true


vim.o.breakindent = true

vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience

vim.o.termguicolors = true             -- NOTE: You should make sure your terminal supports this
