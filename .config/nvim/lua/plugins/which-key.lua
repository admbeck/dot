return { -- whick-key.nvim: hotkey cheat sheet
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.register({ -- <leader>
      c = { name = "Compile" },
      d = { name = "Debug" },
      g = {
        name = "Git",
        h = "Signs",
      },
      q = { name = "Session"},
      t = { "Launch file" },
      z = { name = "Visual" },
    }, { prefix = "<leader>" })
  end,
}
