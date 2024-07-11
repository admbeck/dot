return { -- lazygit.nvim: git ui
  "kdheepak/lazygit.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>gt",
      "<cmd>LazyGitCurrentFile<CR>",
      desc = "LazyGit",
    },
  },
}
