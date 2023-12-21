return {
  { -- aerial.nvim: code aware navigation
    "stevearc/aerial.nvim",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>a",
        "<cmd>AerialToggle!<CR>",
        desc = "Aerial navigation",
      },
      {
        "<leader>[",
        "<cmd>AerialPrev<CR>",
        desc = "Aerial previous",
      },
      {
        "<leader>]",
        "<cmd>AerialNext<CR>",
        desc = "Aerial next",
      },
    },
  },
  { -- surround-ui.nvim: training aid for nvim-surround
    "roobert/surround-ui.nvim",
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    opts = {
      root_key = "S",
    },
  },
  { -- noice.nvim: new ui for messages, cmdline and popupmenu
    "folke/noice.nvim",
    enabled = true,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      local search = vim.api.nvim_get_hl_by_name("Search", true)
      vim.api.nvim_set_hl(0, "TransparentSearch", { fg = search.foreground })

      local help = vim.api.nvim_get_hl_by_name("IncSearch", true)
      vim.api.nvim_set_hl(0, "TransparentHelp", { fg = help.foreground })

      local cmdGroup = "DevIconLua"
      local noice_cmd_types = {
        CmdLine = cmdGroup,
        Input = cmdGroup,
        Lua = cmdGroup,
        Filter = cmdGroup,
        Rename = cmdGroup,
        Substitute = "Define",
        Help = "TransparentHelp",
        Search = "TransparentSearch",
      }

      for type, hl in pairs(noice_cmd_types) do
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder" .. type, { link = hl })
        vim.api.nvim_set_hl(0, "NoiceCmdlineIcon" .. type, { link = hl })
      end
      vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { link = cmdGroup })

      require("noice").setup({
        cmdline = {
          view = "cmdline",
          format = {
            cmdline = { pattern = "^:", icon = ":", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "?" },
          },
        },
        popupmenu = {
          backend = "cmp",
        },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      })
    end,
  },
  { -- nvim-notify: new ui for notifications
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    module = true,
    keys = {
      {
        "<leader>fn",
        function()
          require("telescope").extensions.notify.notify()
        end,
        desc = "Notification history",
      },
    },
    opts = {
      render = "compact",
      top_down = false,
    },
  },
}
