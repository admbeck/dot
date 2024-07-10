return { -- nvim-notify: new ui for notifications
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
    {
      "<leader>xnn",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss all Notifications",
    },
  },
  opts = {
    render = "compact",
    top_down = false,
  },
}
