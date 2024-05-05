vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = '[F]ind [G]it files' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind  [H]elp' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>ut', "<cmd>Telescope undo<cr>", { desc = '[U]ndo [T]ree' })
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles,
    { desc = '[F]ind recently [O]pened files' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers,
    { desc = '[F]ind existing [B]uffers' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string,
    { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fp', require('telescope.builtin').live_grep,
    { desc = '[F]ind by grep [P]attern' })
