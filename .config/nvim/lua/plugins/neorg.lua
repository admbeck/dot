return {
  { -- neorg: org mode for neovim
    "nvim-neorg/neorg",
    enabled = false,
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
    },
    dependencies = { "luarocks.nvim" },
    cmd = "Neorg",
    -- build = ":Neorg sync-parsers",
    config = function()
      local WIKIPATH = os.getenv("WIKIPATH")
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.completion"] = {
            config = { engine = "nvim-cmp" },
          },
          ["core.integrations.nvim-cmp"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = WIKIPATH .. "/neorg",
              },
              default_workspace = "notes",
              autochdir = true,
            },
          },
          ["core.export.markdown"] = {},
          ["core.integrations.treesitter"] = {},
        },
      })
    end,
  },
  {
    "vhyrro/luarocks.nvim",
    enabled = false,
    priority = 1000,
    opts = {},
  }
}
