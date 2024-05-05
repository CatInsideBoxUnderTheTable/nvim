local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then desc = 'LSP: ' .. desc end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  local get_def = function() require('telescope.builtin').lsp_definitions({ jump_type = 'vsplit' }) end
  nmap('<leader>gd', get_def, '[G]oto [D]efinition')
  nmap('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

  nmap('<leader>nn', vim.lsp.buf.rename, '[N]ew [N]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('<leader>gt', vim.lsp.buf.type_definition, '[G]oto [T]ype definition')
  nmap('<leader>gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  nmap('hd', vim.lsp.buf.hover, '[H]elp show [D]ocumentation')
  nmap('hs', vim.lsp.buf.signature_help, '[H]elp show [S]ignature documentation')

vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_) vim.lsp.buf.format() end,
  { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
local servers = {
  gopls = {},
  clangd = {},
  texlab = {},
  tflint = {},
  cmake = {},
  dotls = {},
  jsonls = { filetypes = { 'json' } },
  marksman = {},
  rust_analyzer = {
    diagnostics = {
      enable = false,
    }
  },
  terraformls = {},
  bashls = {},
  html = { filetypes = { 'html', 'twig', 'hbs' } },
  pyright = {},
  lua_ls = { Lua = { workspace = { checkThirdParty = false }, telemetry = { enable = false }, }, },
}


-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup { ensure_installed = vim.tbl_keys(servers), }

-- integrate with cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}

