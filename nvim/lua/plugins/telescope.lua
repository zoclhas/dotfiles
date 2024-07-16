return {
  "nvim-telescope/telescope.nvim",
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings

        maps.n["<leader><leader>"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" }
        if vim.fn.executable "rg" == 1 then
          maps.n["<leader>/"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" }
        end
      end,
    },
  },
}
