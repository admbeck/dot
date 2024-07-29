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
  ltex = {},
}

return { -- nvim-lspconfig: language server configs
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  keys = {
    {
      "<leader>l",
      "",
      desc = "LSP",
    },
    {
      "<leader>la",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "LSP code actions",
    },
    {
      "<leader>lS",
      "<cmd>LspStart<CR>",
      desc = "Start LSP server",
    },
    {
      "<leader>ls",
      "<cmd>LspStop<CR>",
      desc = "Stop LSP server",
    },
    {
      "<leader>lR",
      "<cmd>LspRestart<CR>",
      desc = "Restart LSP server",
    },
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local on_attach = require("core.lsp").on_attach
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- install servers defined at the top
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    -- make sure the servers actually work with cmp
    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
        })
      end,
      ["ltex"] = function()
        require("lspconfig")["ltex"].setup({
          autostart = false,
          settings = {
            ltex = {
              language = "en-US",
              checkFrequency = "save",
              disabledRules = {
                ["en-US"] = {
                  "PROFANITY",
                  "MORFOLOGIK_RULE_EN_US",
                },
              },
            },
          },
        })
      end,
    })
  end,
  opts = {
    inlay_hints = { enabled = true },
  },
}
