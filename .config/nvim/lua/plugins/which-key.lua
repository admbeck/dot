return { -- whick-key.nvim: hotkey cheat sheet
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require("which-key").add({
    { "<leader>c", group = "Compile" },
    { "<leader>g", group = "Git" },
    { "<leader>q", group = "Session" },
    { "<leader>t", group = "Launch file" },
    { "<leader>z", group = "Visual" },
  })
  end,
}
