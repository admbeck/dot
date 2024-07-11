return { -- vim-flog: git branch visualization
  "rbong/vim-flog",
  lazy = true,
  cmd = { "Flog", "Flogsplit", "Floggit" },
  dependencies = {
    "tpope/vim-fugitive",
  },
  keys = {
    {
      "<leader>gl",
      "",
      desc = "Git log",
    },
    {
      "<leader>glo",
      "<cmd>Flog<CR>",
      desc = "Open git log",
    },
    {
      "<leader>gls",
      "<cmd>Flogsplit<CR>",
      desc = "Open git log in split"
    },
  },
}
