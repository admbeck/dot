return { -- aerial.nvim: code aware navigation
  "stevearc/aerial.nvim",
  opts = {},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>a",
      "<cmd>AerialToggle!<CR>",
      desc = "Aerial navigation",
    },
    {
      "<leader>[",
      "<cmd>AerialPrev<CR>",
      desc = "Aerial previous",
    },
    {
      "<leader>]",
      "<cmd>AerialNext<CR>",
      desc = "Aerial next",
    },
  },
}
