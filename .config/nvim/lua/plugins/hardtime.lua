return { -- hardtime.nvim: hints for better vim-like workflow
  "m4xshen/hardtime.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },
  opts = {
    -- disable messages for movement keys
    restricted_keys = {
      ["h"] = {},
      ["j"] = {},
      ["k"] = {},
      ["l"] = {},
    },
    -- enable arrow buttons
    disabled_keys = {
      ["<Up>"] = {},
      ["<Down>"] = {},
      ["<Left>"] = {},
      ["<Right>"] = {},
    },
    restriction_mode = "hint",
    disable_mouse = false,
  },
}
