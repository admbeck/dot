-- custom settings for python

vim.opt_local.textwidth = 79

-- Run python script
-- With terminal
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>tl",
  "<cmd>w!<CR><cmd>AsyncRun -save=1 -mode=term -pos=external python '$(VIM_FILEPATH)'<CR>",
  { noremap = true, desc = "With terminal" }
)
-- Without terminal
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>tn",
  "<cmd>w!<CR><cmd>AsyncRun -save=1 python '$(VIM_FILEPATH)'<CR>",
  { noremap = true, desc = "With terminal" }
)
