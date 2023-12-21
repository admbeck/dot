return {
  { -- conform.nvim: automatic formatter
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
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
  },
  { -- nvim-lint: linter
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "<leader>cl",
        function()
          require("lint").try_lint()
        end,
        desc = "Try linting current file",
      },
    },
    opts = {
      linters_by_ft = {
        lua = { "selene", "luacheck" },
        markdown = { "markdownlint-cli2" },
        sh = { "shellcheck" },
        python = { "flake8" },
      },
      linters = {
        selene = {
          condition = function(ctx)
            return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
          end,
        },
        luacheck = {
          condition = function(ctx)
            return vim.fs.find({ ".luacheckrc" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
    config = function()
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
