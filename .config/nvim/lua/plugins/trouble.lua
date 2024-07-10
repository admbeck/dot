return { -- trouble.nvim: UI for LSP errors
  "folke/trouble.nvim",
  cmd = "Trouble",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
  keys = {
    {
      "<leader>x",
      "",
      desc = "Trouble",
    },
    {
      "<leader>xx",
      function()
        require("trouble").open()
      end,
      desc = "Open Trouble",
    },
    {
      "<leader>xw",
      function()
        require("trouble").open("workspace_diagnostics")
      end,
      desc = "Workspace diagnostics",
    },
    {
      "<leader>xd",
      function()
        require("trouble").open("document_diagnostics")
      end,
      desc = "Document diagnostics",
    },
    {
      "<leader>xq",
      function()
        require("trouble").open("quickfix")
      end,
      desc = "Quickfix",
    },
    {
      "<leader>xl",
      function()
        require("trouble").open("loclist")
      end,
      desc = "Loclist",
    },
    {
      "gR",
      function()
        require("trouble").open("lsp_references")
      end,
      desc = "Lsp references",
    },
  },
}
