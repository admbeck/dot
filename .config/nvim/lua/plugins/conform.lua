return { -- conform.nvim: automatic formatter
  "stevearc/conform.nvim",
  event = "LspAttach",
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      javascript = {
        { "prettierd", "prettier" },
      },
      typescript = {
        { "prettierd", "prettier" },
      },
      html = {
        { "prettierd", "prettier" },
      },
      css = {
        { "prettierd", "prettier" },
      },
      markdown = { "markdownlint-cli2" },
      lua = { "stylua" },
      python = { "black" },
      c = { "clang-format" },
      sh = { "shfmt" },
    },
    formatters = {
      ["clang-format"] = {
        command = "clang-format",
        args = {
          "-assume-filename",
          "$FILENAME",
          "-style",
          "{BasedOnStyle: mozilla, IndentWidth: 4, AlignConsecutiveDeclarations: true}",
        },
      },
      shfmt = {
        prepend_args = { "-i", "4" },
      },
    },
  },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({
          lsp_fallback = true,
          timeout_ms = 500,
        })
      end,
      desc = "Format buffer",
    },
  },
}
