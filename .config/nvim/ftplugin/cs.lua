-- custom settings for c#

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>tl",
  "<cmd>w!<CR><cmd>AsyncRun -save=1 -mode=term -pos=external dotnet run<CR>",
  { noremap = true, desc = "Compile and run" }
)
