return { -- mason-tool-installer: linter and other mason plugins installer
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
}
