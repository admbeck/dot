return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
  keys = {
     {
       "<leader>xx",
       function()
         require("trouble").open()
       end,
       desc = "open",
    },
    {
      "<leader>xw",
      function()
        require("trouble").open("workspace_diagnostics")
      end,
      desc = "workspace diagnostics",
    },
    {
       "<leader>xd",
       function()
         require("trouble").open("document_diagnostics")
       end,
       desc = "document diagnostics",
    },
    {
       "<leader>xq",
       function()
         require("trouble").open("quickfix")
       end,
       desc = "quickfix",
    },
    {
       "<leader>xl",
       function()
         require("trouble").open("loclist")
       end,
       desc = "loclist",
    },
    {
       "gR",
       function()
         require("trouble").open("lsp_references")
       end,
       desc = "lsp references",
    },
  },
}
