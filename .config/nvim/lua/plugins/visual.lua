return {
  { -- due.nvim: provides you due for the date string in <2022-01-10>
    "Nfrid/due.nvim",
    event = "VeryLazy",
    config = function()
      local autodue = vim.api.nvim_create_augroup("autodue", { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        pattern = "*",
        group = autodue,
        desc = "autorecount due",
        callback = function()
          require("due_nvim").redraw(0)
        end,
      })

      require("due_nvim").setup()
    end,
  },
  { -- restore_view.vim: automatically restore file's cursor position
    "vim-scripts/restore_view.vim",
  },
  { -- colors #fbf in the editor
    "norcalli/nvim-colorizer.lua",
    ft = {
      "css",
      "html",
      "sass",
      "js",
    },
    config = function()
      require("colorizer").setup()
    end,
  },
  { -- styler.nvim: unique styles for filetypes
    "folke/styler.nvim",
    config = function()
      require("styler").setup({
        themes = {
          -- markdown = { colorscheme = "gruvbox" },
          -- help = { colorscheme = "catppuccin-mocha", background = "dark" },
        },
      })
    end,
  },
  { -- twilight.nvim: inactive portions dimmer
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
  },
  { -- zen-mode.nvim: zenmode
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      {
        "<leader>zz",
        "<cmd>ZenMode<CR>",
        desc = "Toggle Zenmode",
      },
      {
        "<leader>zp",
        "<cmd>set bg=light | set linebreak | lua require('zen-mode').toggle({window={width=.60,height=.80}})<CR>",
        desc = "Readable prose",
      },
    },
    opts = {
      window = {
        backdrop = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
    },
    init = function()
      local zenmodedefault = vim.api.nvim_create_augroup("zenmodedefault", { clear = true })
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "/tmp/neomutt*",
        group = zenmodedefault,
        callback = function()
          vim.cmd([[set bg=light]])
          require("zen-mode").toggle()
          vim.keymap.set("", "ZZ", ":ZenMode|x!<CR>")
          vim.keymap.set("", "ZQ", ":ZenMode|q!<CR>")
        end,
      })
    end,
  },
  { -- hardtime.nvim: hints for better vim-like workflow
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
  },
  { -- todo-comments.nvim: fancy highlighting for comments
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = true,
    keys = {
      {
        "<leader>}",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "<leader>{",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
    },
  },
  { -- nabla.nvim: math visualization
    "jbyuki/nabla.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      {
        "<leader>ma",
        function()
          require("nabla").popup()
        end,
        desc = "Preview in popup",
      },
      {
        "<leader>mm",
        function()
          require("nabla").toggle_virt()
        end,
        desc = "Toggle preview",
      },
    },
  },
  { -- cisco.vim: cisco highlighting
    "admbeck/cisco.vim",
  },
}
