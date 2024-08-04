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
    opts.event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.cmd([[
          setlocal number relativenumber
        ]])
        end,
      },
    }
  end,
}
