return { -- markdown.nvim: concealement and pretty notes
  "MeanderingProgrammer/markdown.nvim",
  requires = { "nvim-treesitter/nvim-treesitter" },
  ft = "markdown",
  opts = {
    headings = { "● ", "○ ", "▶ ", "◆ ", "◇ ", "⤷ " },
    bullets = { "● ", "○ ", "▶ ", "◆ " },
  },
}
