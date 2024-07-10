return { -- styler.nvim: unique styles for filetypes
  "folke/styler.nvim",
  config = function()
    require("styler").setup({
      themes = {
        -- markdown = { colorscheme = "gruvbox" },
        -- help = { colorscheme = "catppuccin-mocha", background = "dark" },
      },
    })
  end,
}
