return {
  { "phha/zenburn.nvim", event = "VeryLazy" },
  { "navarasu/onedark.nvim", event = "VeryLazy" },
  { "rebelot/kanagawa.nvim", event = "VeryLazy" },
  { "folke/tokyonight.nvim", event = "VeryLazy" },
  { "zootedb0t/citruszest.nvim", event = "VeryLazy" },
  { "olivercederborg/poimandres.nvim", event = "VeryLazy" },
  { "nyoom-engineering/oxocarbon.nvim", event = "VeryLazy" },
  { "rose-pine/neovim", name = "rose-pine", event = "VeryLazy" },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "gruvbox"
    end
  },
}
