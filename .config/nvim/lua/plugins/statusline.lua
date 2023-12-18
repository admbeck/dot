return {
  { -- fast statusline
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- remove messages on last line
      vim.opt.showmode = false
      -- hide native ruler
      vim.opt.ruler = false
      -- hide command output
      vim.opt.showcmd = false

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { "" },
          section_separators = { "" }, -- component_separators = { left = "", right = ""}, section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {
            { "mode",
          --[[ function ()
              return mode_map[vim.api.nvim_get_mode().mode] or "__"
            end ]] }
            },
            lualine_b = {
              "filesize",
            },
            lualine_c = {
              {
                "filetype",
                colored = false,
                icon_only = true,
                -- icon = { align = "left" },
                padding = { left = 1, right = 1 },
              },
              {
                "filename",
                file_status = true,
                shorting_target = 40,
                path = 1,
                symbols = {
                  modified = "[+]",
                  readonly = "[]",
                  unnamed  = "[?]",
                  newfile  = "[!]",
                },
                separator = "",
              },
            },
            lualine_x = {
              { -- @ recording indicator
                require("noice").api.statusline.mode.get,
                cond = require("noice").api.statusline.mode.has,
                color = { fg = "#ff9e64" },
              },
              {
                "diff",
              },
              {
                "diagnostics",
              },
              {
                function()
                  local space_pat = [[\v^ +]]
                  local tab_pat = [[\v^\t+]]
                  local space_indent = vim.fn.search(space_pat, 'nwc')
                  local tab_indent = vim.fn.search(tab_pat, 'nwc')
                  local mixed = (space_indent > 0 and tab_indent > 0)
                  local mixed_same_line
                  if not mixed then
                    mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], 'nwc')
                    mixed = mixed_same_line > 0
                  end
                  if not mixed then return '' end
                  if mixed_same_line ~= nil and mixed_same_line > 0 then
                    return 'MI:'..mixed_same_line
                  end
                  local space_indent_cnt = vim.fn.searchcount({pattern=space_pat, max_count=1e3}).total
                  local tab_indent_cnt =  vim.fn.searchcount({pattern=tab_pat, max_count=1e3}).total
                  if space_indent_cnt > tab_indent_cnt then
                    return 'MI:'..tab_indent
                  else
                    return 'MI:'..space_indent
                  end
                end
              },
              {
                "FugitiveHead",
                icon = "",
                separator = "",
              },
            },
            lualine_y = {
              {
                "encoding",
                cond = function () return vim.opt.fileencoding:get() ~= "utf-8" end
              },
              {
                "fileformat",
                padding = { left = 1, right = 2 },
              },
            },
            lualine_z = {
              {
                "location",
                separator = "",
              },
              {
                "progress",
                separator = "",
              },
            }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {"filename"},
          lualine_x = {"location"},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {
          -- lualine_a = {
          --   {
          --     "tabs",
          --     mode = 1,
          --     fmt = function(name, context)
          --       -- Show + if buffer is modified in tab
          --       local buflist = vim.fn.tabpagebuflist(context.tabnr)
          --       local winnr = vim.fn.tabpagewinnr(context.tabnr)
          --       local bufnr = buflist[winnr]
          --       local mod = vim.fn.getbufvar(bufnr, '&mod')

          --       return name .. (mod == 1 and ' +' or '')
          --     end
          --   },
          -- },
          -- lualine_b = {},
          -- lualine_c = {},
          -- lualine_x = {},
          -- lualine_y = {},
          -- lualine_z = {}
        },
        -- bar above tabline
        winbar = {},
        inactive_winbar = {},
        extensions = {
          "aerial",
          "fugitive",
          "lazy",
          "man",
          "mason",
          "nvim-tree",
          "trouble",
        }
      })
    end,
  }
}
