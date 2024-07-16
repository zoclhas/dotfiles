return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      opts = {
        override = {
          [".env.local"] = {
            icon = "",
            color = "#faf743",
            name = "Env",
          },
          [".env.example"] = {
            icon = "",
            color = "#faf743",
            name = "Env",
          },
        },
      },
    },
  },
  spec = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<Leader>e"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle Explorer" }
      end,
    },
  },
  opts = function(_, opts)
    opts.filesystem.filtered_items = {
      visible = true,
      show_hidden_count = true,
      hide_dotfiles = false,
      hide_by_name = {
        ".git",
        "node_modules",
      },
    }

    opts.window.position = "right"

    opts.window.mappings["H"] = "prev_source"
    opts.window.mappings["L"] = "next_source"
  end,
}
