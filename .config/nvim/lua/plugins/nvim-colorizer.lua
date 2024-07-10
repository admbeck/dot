return { -- nvim-colorizer.lua: colors #fbf in the editor
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
}
