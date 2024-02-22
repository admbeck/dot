return {
  { -- nvim-snippy: snippets
    "dcampos/nvim-snippy",
    init = function()
      -- variables for snippets
      vim.g.snips_author = "Zakhidov Beck"
      vim.g.snips_email = "admbeck@outlook.com"
      vim.g.snips_github = "https://github.com/admbeck"
    end,
  },
  { -- nvim-cmp: autocompletion
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "FelipeLema/cmp-async-path",
      "hrsh7th/cmp-cmdline",
      "dcampos/nvim-snippy",
      "dcampos/cmp-snippy",
      "hrsh7th/cmp-calc",
      "lukas-reineke/cmp-under-comparator",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-nvim-lua",
      "jc-doyle/cmp-pandoc-references",
    },
    config = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local snippy = require("snippy")

      cmp.setup({
        snippet = {
          -- snippet engine
          expand = function(args)
            snippy.expand_snippet(args.body)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(snippy),
        },
        view = {
          entries = { name = "custom", selection_order = "near_cursor" },
        },
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif snippy.can_expand_or_advance() then
              snippy.expand_or_advance()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif snippy.can_jump(-1) then
              snippy.previous()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "snippy" },
          { name = "buffer" },
          { name = "async_path " },
          { name = "calc" },
          {
            name = "omni",
            option = {
              disable_omnifuncs = { "v.lua.vim.lsp.omnifunc" },
            },
          },
          { name = "nvim_lua" },
          { name = "pandoc_references" },
        }),
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ":" (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
