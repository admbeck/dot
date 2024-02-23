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
      "hrsh7th/cmp-path",
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

      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

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
        completion = {
          completeopt = "menu,menuone,noinsert",
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

          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
          { name = "snippy" },
          { name = "calc" },
          { name = "nvim_lua" },
          { name = "pandoc_references" },
        }),
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
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
  { -- nvim-ts-autotag: Automatically add closing tags for HTML and JSX
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    opts = {},
  },
  { -- nvim-treesitter-context: Show context of the current function
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    enabled = true,
    opts = {
      enable = false,
      mode = "cursor",
      max_lines = 3,
    },
    keys = {
      {
        "<leader>zt",
        function()
          require("treesitter-context").toggle()
        end,
        desc = "Toggle Treesitter Context",
      },
    },
  },
}
