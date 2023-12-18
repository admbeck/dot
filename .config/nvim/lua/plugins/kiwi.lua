return {
  "serenevoid/kiwi.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  opts = {
    {
      name = "main",
      path = "/home/beck/docs/notes",
      wiki = true,
    },
    {
      name = "personal",
      path = "/home/beck/docs/notes/personal",
      wiki = true,
    },
    {
      name = "education",
      path = "/home/beck/docs/notes/edu",
      wiki = true,
    },
    {
      name = "games",
      path = "/home/beck/docs/notes/games",
      wiki = true,
    },
    {
      name = "campfire",
      path = "/home/beck/docs/notes/campfire",
      wiki = true,
    },
    {
      name = "work",
      path = "/home/beck/docs/notes/work",
      wiki = true,
    },
    {
      name = "tech",
      path = "/home/beck/docs/notes/tech",
      wiki = true,
    },
    {
      name = "linux",
      path = "/home/beck/docs/notes/linux",
      wiki = true,
    },
    {
      name = "windows",
      path = "/home/beck/docs/notes/windows",
      wiki = true,
    },
    {
      name = "mac",
      path = "/home/beck/docs/notes/mac",
      wiki = true,
    },
    {
      name = "networks",
      path = "/home/beck/docs/notes/networks",
      wiki = true,
    },
    {
      name = "cloud",
      path = "/home/beck/docs/notes/cloud",
      wiki = true,
    },
    {
      name = "code",
      path = "/home/beck/docs/notes/code",
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
    }
  },
  lazy = true
}
