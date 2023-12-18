return { -- hotkey cheat sheet
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    -- TODO: Add all other keys
    wk.register({ -- <leader>
      f = {
        name = "Telescope"
      },
    }, { prefix = "<leader>" })
  end,
}
