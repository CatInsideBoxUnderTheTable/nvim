-- :so refreshes your config on flight
-- :setlocal spell spelllang=en_us  -- to change spelling

print("starting integrations.")

function WrapInDiagnostic(text)
  print(" " .. text)
  require(text)
  print(" " .. text)
end

WrapInDiagnostic('custom.vimSettings')
WrapInDiagnostic('custom.packageManager')
WrapInDiagnostic('custom.plugins')
WrapInDiagnostic('custom.cmp')
WrapInDiagnostic('custom.lsp') --requires telescope and cmp
WrapInDiagnostic('custom.treesitter')

WrapInDiagnostic('custom.keymapsGeneric')
WrapInDiagnostic('custom.keymapsTelescope')
WrapInDiagnostic('custom.keymapsHarpoon')
WrapInDiagnostic('custom.keymapsNvimTree')
WrapInDiagnostic('custom.keymapsDiagnostic')
WrapInDiagnostic('custom.keymapsVimtex')

WrapInDiagnostic('custom.ownCommands')

print("integrations done.")
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
