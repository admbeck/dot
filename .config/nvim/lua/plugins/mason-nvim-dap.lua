return { -- mason-nvim-dap.nvim: bridge for mason and nvim-dap
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "mfussenegger/nvim-dap",
    "williamboman/mason.nvim",
  },
  cmd = { "DapInstall", "DapUninstall" },
  opts = {
    ensure_installed = { "python" },
  },
}
