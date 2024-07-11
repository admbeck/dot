return { -- gitsigns.nvim: highlights text that has changed since the list git commit
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>gh",
      "",
      mode = { "n", "v" },
      desc = "Sign operations",
    },
    {
      "<leader>ghs",
      ":Gitsigns stage_hunk<CR>",
      mode = { "n", "v" },
      desc = "Stage Hunk",
    },
    {
      "<leader>ghr",
      ":Gitsigns reset_hunk<CR>",
      mode = { "n", "v" },
      desc = "Reset Hunk",
    },
    {
      "ih",
      ":<C-U>Gitsigns select_hunk<CR>",
      mode = { "o", "x" },
      desc = "GitSigns Select Hunk",
    },
  },
  opts = {
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
      map("n", "<leader>ghb", function()
        gs.blame_line({ full = true })
      end, "Blame Line")
      map("n", "<leader>ghd", gs.diffthis, "Diff This")
      map("n", "<leader>ghD", function()
        gs.diffthis("~")
      end, "Diff This ~")
    end,
  },
}
