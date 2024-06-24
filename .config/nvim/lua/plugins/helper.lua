return {
  { -- tidy.nvim: clean trailing whitespace
    "mcauley-penney/tidy.nvim",
    event = "VeryLazy",
    config = true,
  },
  { -- nvim-autopairs: auto-close brackets
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  { -- nvim-surround: surround words with symbols
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  { -- diffview.nvim: better Diffs
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
    },
    opts = {},
    keys = {
      {
        "<leader>gd",
        "<cmd>DiffviewOpen<cr>",
        desc = "DiffView",
      },
    },
  },
  { -- asyncrun.vim: scripts and commands to run code
    "skywind3000/asyncrun.vim",
    event = "VeryLazy",
  },
  { -- Comment.nvim: easy comments
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },
  { -- vimtex: LaTeX syntax highlighting, TOC etc.
    "lervag/vimtex",
    ft = "tex",
    config = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_quickfix_mode = "0"
      vim.wo.conceallevel = 1
      vim.g.tex_conceal = "abdmg"
    end,
  },
  { -- sc-im.nvim: markdown tables with sc-im editing
    "DAmesberger/sc-im.nvim",
    ft = "markdown",
    opts = {},
    keys = {
      {
        "<leader>s",
        "",
        desc = "sc-im"
      },
      {
        "<leader>sc",
        "<cmd>lua require('sc-im').open_in_scim()<cr>",
        desc = "Open table in sc-im",
      },
      {
        "<leader>sl",
        "<cmd>lua require('sc-im').open_in_scim(true)<cr>",
        desc = "Open table in sc-im",
      },
      {
        "<leader>sp",
        "<cmd>lua require('sc-im').open_in_scim(false)<cr>",
        desc = "Open plain table in sc-im",
      },
      {
        "<leader>st",
        "<cmd>lua require('sc-im').toggle(true)<cr>",
        desc = "Toggle sc-im link format",
      },
      {
        "<leader>sr",
        "<cmd>lua require('sc-im').rename()<cr>",
        desc = "Rename linked sc-im file",
      },
      {
        "<leader>su",
        "<cmd>lua require('sc-im').update()<cr>",
        desc = "Recalculate Markdown table",
      },
      {
        "<leader>sU",
        "<cmd>lua require('sc-im').update(true)<cr>",
        desc = "Update sc file and Markdown table",
      },
    },
  },
}
