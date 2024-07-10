return { -- nvim-dap-ui: ui for nvim-dap
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  keys = {
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle debugger UI",
    },
    {
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      desc = "Eval",
      mode = { "n", "v" },
    },
  },
  opts = {},
  config = function(_, opts)
    local dapui = require("dapui")
    dapui.setup(opts)
  end,
}
