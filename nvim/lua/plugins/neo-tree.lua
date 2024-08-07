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

    opts.window.mappings["o"] = function(state)
      local node = state.tree:get_node()
      local path = node:get_id()
      -- Linux: open file in default application
      vim.fn.jobstart({ "nemo", path }, { detach = true })
    end
  end,
}
