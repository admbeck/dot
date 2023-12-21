return { -- nvim-tree.lua: file manager
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antosha417/nvim-lsp-file-operations",
  },
  opts = {
    sort_by = function(nodes)
      -- natural sorting
      local function natural_cmp(left, right)
        -- directories first
        if left.type ~= "directory" and right.type == "directory" then
          return false
        elseif left.type == "directory" and right.type ~= "directory" then
          return true
        end

        left = left.name:lower()
        right = right.name:lower()

        if left == right then
          return false
        end

        for i = 1, math.max(string.len(left), string.len(right)), 1 do
          local l = string.sub(left, i, -1)
          local r = string.sub(right, i, -1)

          if type(tonumber(string.sub(l, 1, 1))) == "number" and type(tonumber(string.sub(r, 1, 1))) == "number" then
            local l_number = tonumber(string.match(l, "^[0-9]+"))
            local r_number = tonumber(string.match(r, "^[0-9]+"))

            if l_number ~= r_number then
              return l_number < r_number
            end
          elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
            return l < r
          end
        end
      end
      table.sort(nodes, natural_cmp)
    end,
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = false,
    },
    view = {
      adaptive_size = true,
      width = { min = 20, max = 40 },
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
      custom = { "^.git$" },
    },
  },
  keys = {
    {
      "<leader>n",
      "<cmd>NvimTreeToggle<CR>",
      desc = "Toggle nvim-tree",
    },
  },
}
