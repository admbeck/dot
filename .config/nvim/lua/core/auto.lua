--[[ AUTOMATIZATION
     autocmds and shortcuts to save a few keypresses
]]
-- more accurate syntax highlighting
local acc_syn_highlight = vim.api.nvim_create_augroup("acc_syn_highlight", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  group = acc_syn_highlight,
  desc = "more accurately highlight syntax",
  command = "syntax sync fromstart",
})

-- preserve undo even after closing neovim
vim.cmd([[
  if !isdirectory($HOME . '/.local/share/vim/undo')
    call mkdir($HOME . '/.local/share/vim/undo', 'p', 0700)
  endif
  set undodir=~/.local/share/vim/undo
  set undofile
  set undolevels=10000
]])

-- autorecompile dwmblocks
local recompile_dwmblocks = vim.api.nvim_create_augroup("recompile_dwmblocks", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "~/.local/src/dwmblocks/config.h",
  group = recompile_dwmblocks,
  desc = "automatically recompile dwmblocks",
  command = "!cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }",
})

-- reload Xresources
-- run xrdb whenever Xdefaults or Xresources are updated.
local auto_xrdb = vim.api.nvim_create_augroup("auto_xrdb", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Xresources,Xdefaults,xresources,xdefaults",
  group = auto_xrdb,
  desc = "automatically set correct filetype",
  callback = function()
    vim.bo.filetype = "xdefaults"
  end,
})
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "Xresources,Xdefaults,xresources,xdefaults",
  group = auto_xrdb,
  desc = "reload xrdb",
  command = "!xrdb r",
})

-- save file as sudo when needed
vim.cmd([[cabbrev w!! execute 'silent! write !doas tee % >/dev/null' <bar> edit!]])
