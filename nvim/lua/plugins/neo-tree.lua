return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
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
  end,
}
