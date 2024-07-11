return { -- vim-fugitive: git wrapper
  "tpope/vim-fugitive",
  event = "VeryLazy",
  keys = {
    {
      "<leader>gg",
      "<cmd>Git<CR>",
      desc = "Open git",
    },
  },
}
