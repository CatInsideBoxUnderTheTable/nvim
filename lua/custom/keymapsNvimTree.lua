vim.api.nvim_set_keymap('n', '<leader>nt', ':NvimTreeToggle<CR>',
  { noremap = true, silent = true, desc = 'show file tree' })
vim.api.nvim_set_keymap('n', '<leader>nf', ':NvimTreeFindFileToggle<CR>',
  { noremap = true, silent = true, desc = 'find file in file tree' })
