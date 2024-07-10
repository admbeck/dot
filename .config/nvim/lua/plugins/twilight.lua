return { -- twilight.nvim: inactive portions dimmer
  "folke/twilight.nvim",
  cmd = "Twilight",
  opts = {
    dimming = {
      alpha = 0.25,
    },
  },
  keys = {
    {
      "<leader>zl",
      "<cmd>Twilight<CR>",
      desc = "Toggle Limelight",
    },
  },
}
