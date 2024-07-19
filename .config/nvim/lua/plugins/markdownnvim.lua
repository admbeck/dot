return { -- markdown.nvim: concealement and pretty notes
  "MeanderingProgrammer/markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  ft = "markdown",
  keys = {
    {
      "<leader>zm",
      "<cmd>lua require('render-markdown').toggle()<CR>",
      desc = "Toggle markdown concealement",
      ft = "markdown",
    },
  },
  opts = {
    -- https://neovim.io/doc/user/treesitter.html - reference for highlights
    anti_conceal = {
      enabled = false,
    },
    link = {
      hyperlink = "",
    },
    checkbox = {
      unchecked = {
        icon = "󰄰 ",
      },
      checked = {
        icon = "󰄴 ",
      },
      custom = {
        todo = { -- pending
          rendered = "󰍷 ",
          highlight = "@markup.link.label",
        },
        canceled = {
          raw = "[_]",
          rendered = "󱃓 ",
          highlight = "@comment",
        },
        paused = { -- on hold
          raw = "[=]",
          rendered = "󰏦 ",
          highlight = "@markup.link.label",
        },
        more_input = { -- needs further input
          raw = "[?]",
          rendered = " ",
          highlight = "@comment.warning",
        },
        urgent = {
          raw = "[!]",
          rendered = "󰗖 ",
          highlight = "@comment.error",
        },
      },
    },
  },
}
