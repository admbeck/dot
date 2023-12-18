-- custom settings for lua

vim.opt_local.textwidth = 120
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- Run lua script
-- With terminal
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>tl",
  "<cmd>w!<CR><cmd>AsyncRun -mode=term -pos=external lua %<CR>",
  { noremap = true, desc = "With terminal" }
)
-- Without terminal
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>tn",
  "<cmd>w!<CR><cmd>AsyncRun lua %<CR>",
  { noremap = true, desc = "Without terminal" }
)

--[[
-- Run love2d
-- With terminal
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<Leader>lt",
  "<cmd>w!<CR><cmd>AsyncRun -mode=term -pos=external lovec .<CR>",
  { noremap = true, desc = "Love2d with terminal" }
)
-- Without terminal
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<Leader>lr",
  "<cmd>w!<CR><cmd>AsyncRun love .<CR>",
  { noremap = true, desc = "Love2d without terminal" }
)
]]
