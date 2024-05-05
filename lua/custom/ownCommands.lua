function SPOTIFY(command, args) os.execute("playerctl -p spotify " .. command .. " " .. args.args) end

vim.api.nvim_create_user_command('Splay', function(args) SPOTIFY("play", args) end, { nargs = "?" })
vim.api.nvim_create_user_command('Spause', function(args) SPOTIFY("pause", args) end, { nargs = "?" })
vim.api.nvim_create_user_command('Snext', function(args) SPOTIFY("next", args) end, { nargs = "?" })
vim.api.nvim_create_user_command('Sprev', function(args) SPOTIFY("previous", args) end, { nargs = "?" })
vim.api.nvim_create_user_command('Svol', function(args) SPOTIFY("volume", args) end, { nargs = "?" })

function LANG(args)
  local accu = "setlocal spell spelllang="

  args = string.lower(args.args)
  if args == "pl" then
    accu = accu .. "pl"
  else
    accu = accu .. "en_us"
  end

  print(accu)
  vim.cmd(accu)
end

vim.api.nvim_create_user_command('Lang', function(args) LANG(args) end, { nargs = "?" })
