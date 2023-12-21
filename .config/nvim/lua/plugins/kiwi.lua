local WIKIPATH = os.getenv("WIKIPATH") .. "/kiwi"
return { -- kiwi.nvim: vimwiki substitute
  "serenevoid/kiwi.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = { "md", "rmd", "markdown" },
  opts = {
    {
      name = "main",
      path = WIKIPATH,
      wiki = true,
    },
    {
      name = "personal",
      path = WIKIPATH .. "/personal",
      wiki = true,
    },
    {
      name = "education",
      path = WIKIPATH .. "/edu",
      wiki = true,
    },
    {
      name = "games",
      path = WIKIPATH .. "/games",
      wiki = true,
    },
    {
      name = "campfire",
      path = WIKIPATH .. "/campfire",
      wiki = true,
    },
    {
      name = "work",
      path = WIKIPATH .. "/work",
      wiki = true,
    },
    {
      name = "tech",
      path = WIKIPATH .. "/tech",
      wiki = true,
    },
    {
      name = "linux",
      path = WIKIPATH .. "/linux",
      wiki = true,
    },
    {
      name = "windows",
      path = WIKIPATH .. "/windows",
      wiki = true,
    },
    {
      name = "mac",
      path = WIKIPATH .. "/mac",
      wiki = true,
    },
    {
      name = "networks",
      path = WIKIPATH .. "/networks",
      wiki = true,
    },
    {
      name = "cloud",
      path = WIKIPATH .. "/cloud",
      wiki = true,
    },
    {
      name = "code",
      path = WIKIPATH .. "/code",
      wiki = true,
    },
  },
  keys = {
    {
      "<leader>ww",
      function()
        require("kiwi").open_wiki_index()
      end,
      desc = "Open Wiki index",
    },
    {
      "<leader>b",
      function()
        require("kiwi").todo.toggle()
      end,
      desc = "Toggle Markdown Task",
    },
  },
  lazy = true,
}
