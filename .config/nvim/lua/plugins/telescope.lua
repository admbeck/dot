return { -- fuzzy finder
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  cmd = "Telescope",
  module = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "^%.git$",
        "node_modules",
        "^%.?venv$",
        "^%.?env$"
      },
    },
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find file",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Find buffers",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Find tags",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Find fuzzy",
    },
  },
}
