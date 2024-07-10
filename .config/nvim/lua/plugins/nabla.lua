return { -- nabla.nvim: math visualization
  "jbyuki/nabla.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    {
      "<leader>m",
      "",
      desc = "Math",
    },
    {
      "<leader>ma",
      function()
        require("nabla").popup()
      end,
      desc = "Preview in popup",
    },
    {
      "<leader>mm",
      function()
        require("nabla").toggle_virt()
      end,
      desc = "Toggle preview",
    },
  },
}
