return {
  "jakewvincent/mkdnflow.nvim",
  -- enabled = false,
  ft = { "md", "rmd", "markdown" },
  config = function()
    local cmp = require("cmp")
    local wk = require("which-key")
    cmp.setup({
      sources = cmp.config.sources({
        { name = "mkdnflow" },
      })
    })
    wk.register({
      w = {
        name = "Wiki",
        p = "Create link from clipboard",
        n = "Update numbering",
        f = "Fold section",
        F = "Unfold section",
        i = {
          name = "Insert into table",
          r = "New Row ▼",
          R = "New Row ▲",
          c = "New Column ►",
          C = "New Column ◄",
        },
      },
    }, {prefix = "<leader>"})

    require("mkdnflow").setup({
      modules = {
        folds = true,
        conceal = false,
      },
      perspective = {
        priority = "current",
        fallback = "first",
      },
      links = {
        transform_explicit = function(text)
          text = text:gsub("[ /]", "-")
          text = text:gsub("[:/]", "-")
          text = text:lower()
          return text
        end
      },
      new_file_template = {
        use_template = true,
        template = "# {{title}}",
        placeholders = {
          before = {
            title = "link_title",
          },
        },
      },
      mappings = {
        MkdnFoldSection = { "n", "<leader>wf" },
        MkdnUnfoldSection = { "n", "<leader>wF" },
        MkdnUpdateNumbering = { "n", "<leader>wn" },
        MkdnTableNewRowBelow = { "n", "<leader>wir" },
        MkdnTableNewRowAbove = { "n", "<leader>wiR" },
        MkdnTableNewColAfter = { "n", "<leader>wic" },
        MkdnTableNewColBefore = { "n", "<leader>wiC" },
        MkdnCreateLinkFromClipboard = {{"n", "v"}, "<leader>wp"},
      },
    })
  end
}
