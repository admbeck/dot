return { -- nvim-dap-python: python integration with dap
  "mfussenegger/nvim-dap-python",
  config = function()
    require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
  end,
}
