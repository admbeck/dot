return {
  { -- vim-fugitive: git wrapper
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  { -- vim-flog: git branch visualization
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
  { -- lazygit.nvim: git ui
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>gg",
        "<cmd>LazyGitCurrentFile<CR>",
        desc = "LazyGit",
      },
    },
  },
}
