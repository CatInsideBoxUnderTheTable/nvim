vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>hd', vim.lsp.buf.hover, { desc = '[H]elp show [D]ocumentation' })
vim.keymap.set('n', '<leader>hs', vim.lsp.buf.signature_help, { desc = '[H]elp show [S]ignature documentation' })

vim.keymap.set('n', '<leader>bn', ":bn<cr>", { desc = '[B]uffer [N]ext' })
vim.keymap.set('n', '<leader>bp', ":bp<cr>", { desc = '[B]uffer [P]revious' })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
