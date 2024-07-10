return { -- sc-im.nvim: markdown tables with sc-im editing
  "DAmesberger/sc-im.nvim",
  ft = "markdown",
  opts = {},
  keys = {
    {
      "<leader>s",
      "",
      desc = "sc-im",
    },
    {
      "<leader>sc",
      "<cmd>lua require('sc-im').open_in_scim()<cr>",
      desc = "Open table in sc-im",
    },
    {
      "<leader>sl",
      "<cmd>lua require('sc-im').open_in_scim(true)<cr>",
      desc = "Open table in sc-im",
    },
    {
      "<leader>sp",
      "<cmd>lua require('sc-im').open_in_scim(false)<cr>",
      desc = "Open plain table in sc-im",
    },
    {
      "<leader>st",
      "<cmd>lua require('sc-im').toggle(true)<cr>",
      desc = "Toggle sc-im link format",
    },
    {
      "<leader>sr",
      "<cmd>lua require('sc-im').rename()<cr>",
      desc = "Rename linked sc-im file",
    },
    {
      "<leader>su",
      "<cmd>lua require('sc-im').update()<cr>",
      desc = "Recalculate Markdown table",
    },
    {
      "<leader>sU",
      "<cmd>lua require('sc-im').update(true)<cr>",
      desc = "Update sc file and Markdown table",
    },
  },
}
