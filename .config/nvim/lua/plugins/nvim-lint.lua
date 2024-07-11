return { -- nvim-lint: linter
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>Fl",
      "",
      desc = "Linter"
    },
    {
      "<leader>Flt",
      function()
        require("lint").try_lint()
      end,
      desc = "Try linting current file",
    },
    {
      "<leader>Flr",
      function()
        vim.diagnostic.reset(nil, 0)
      end,
      desc = "Reset linting for current file",
    },
    {
      "<leader>Fld",
      function()
        local ft = vim.filetype.match({ buf = 0 })
        require("lint").linters_by_ft[ft] = {}
      end,
      desc = "Disable linting for current filetype",
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
    --   local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    --   vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    --     group = lint_augroup,
    --     callback = function()
    --       require("lint").try_lint()
    --     end,
    --   })
  end,
}
