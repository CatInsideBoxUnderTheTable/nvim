vim.keymap.set('n', 'ep', vim.diagnostic.goto_prev, { desc = 'Go to [E]rror [P]revious' })
vim.keymap.set('n', 'en', vim.diagnostic.goto_next, { desc = 'Go to [E]rror [N]ext' })
-- vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', 'tc', "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Show [T]rouble [C]urrent file list" })
vim.keymap.set('n', 'ta', "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Show [T]rouble [A]all list" })
local trouble_next = function() require("trouble").next({ jump = true, skip_groups = true }) end
local trouble_prev = function() require("trouble").previous({ jump = true, skip_groups = true }) end
vim.keymap.set('n', 'tn', trouble_next, { desc = "[T]rouble [N]ext" })
vim.keymap.set('n', 'tp', trouble_prev, { desc = "[T]rouble [P]revious" })
