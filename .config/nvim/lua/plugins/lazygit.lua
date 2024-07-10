return { -- lazygit.nvim: git ui
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
}
