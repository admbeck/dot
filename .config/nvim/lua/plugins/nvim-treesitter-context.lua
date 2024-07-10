return { -- nvim-treesitter-context: Show context of the current function
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  enabled = true,
  opts = {
    enable = false,
    mode = "cursor",
    max_lines = 3,
  },
  keys = {
    {
      "<leader>zt",
      function()
        require("treesitter-context").toggle()
      end,
      desc = "Toggle Treesitter Context",
    },
  },
}
