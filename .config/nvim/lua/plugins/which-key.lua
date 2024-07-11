return { -- whick-key.nvim: hotkey cheat sheet
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require("which-key").register({ -- <leader>
      c = { name = "Compile" },
      g = { name = "Git" },
      q = { name = "Session" },
      t = { "Launch file" },
      z = { name = "Visual" },
    }, { prefix = "<leader>" })
  end,
}
