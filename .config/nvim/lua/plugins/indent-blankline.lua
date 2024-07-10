return { -- indent-blankline.nvim: indent guides
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "VeryLazy",
  keys = {
    {
      "<leader>zi",
      function()
        require("ibl").setup_buffer(0, {
          enabled = not require("ibl.config").get_config(0).enabled,
        })
      end,
      desc = "Toggle indent lines",
    },
  },
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
        "markdown",
      },
    },
  },
}
