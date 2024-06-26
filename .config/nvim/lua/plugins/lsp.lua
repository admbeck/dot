local servers = {
  ansiblels = {},
  bashls = {},
  clangd = {},
  cssls = {},
  dockerls = {},
  lua_ls = {
    Lua = {
      completion = { callSnippet = "Both" },
      diagnostics = { globals = { "vim" } },
      telemetry = { enable = false },
      workspace = { checkThirdParty = true },
    },
  },
  pylsp = {},
  marksman = {},
}

return {
  { -- mason.nvim: lsp server manager
    "williamboman/mason.nvim",
  },
  { -- mason-tool-installer: linter and other mason plugins installer
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "black",
        "clang-format",
        "markdownlint-cli2",
        "prettierd",
        "selene",
        "luacheck",
        "stylua",
        "shellcheck",
        "shfmt",
      },
    },
  },
  { -- nvim-lspconfig: language server configs
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    keys = {
      {
        "<leader>l",
        function()
          vim.lsp.buf.code_action()
        end,
        desc = "LSP code actions",
      },
    },
    init = function()
      -- disable lsp watcher. Too slow on linux
      local ok, wf = pcall(require, "vim.lsp._watchfiles")
      if ok then
        wf._watchfunc = function()
          return function() end
        end
      end
    end,
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local on_attach = require("core.lsp").on_attach
      local capabilities = require("core.lsp").capabilities

      require("mason").setup()

      -- install servers defined at the top
      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      -- make sure the servers actually work with cmp
      mason_lspconfig.setup_handlers({
        function(server_name)
          if server_name ~= "jdtls" then
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = servers[server_name],
            })
          end
        end,
      })
    end,
    opts = {
      inlay_hints = { enabled = true },
    },
  },
  { -- nvim-lsp-file-operations: file operations for lsp
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
