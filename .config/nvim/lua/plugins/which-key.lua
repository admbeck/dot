return { -- hotkey cheat sheet
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.register({ -- <leader>
      f = {name = "Telescope"},
      c = {name = "Compile"},
      g = {name = "Git"},
      m = {name = "Nabla"},
      t = {"Launch file"},
      v = {name = "Venn"},
      x = {name = "Trouble"},
      z = {name = "Visual"}
    }, { prefix = "<leader>" })
  end,
}
