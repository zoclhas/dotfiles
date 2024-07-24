local augroups = {}

augroups.yankpost = {

  save_cursor_position = {
    event = { "VimEnter", "CursorMoved" },
    pattern = "*",
    callback = function()
      cursor_pos = vim.fn.getpos(".")
    end,
  },

  highlight_yank = {
    event = "TextYankPost",
    pattern = "*",
    callback = function()
      vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400, on_visual = true })
    end,
  },

  yank_restore_cursor = {
    event = "TextYankPost",
    pattern = "*",
    callback = function()
      local cursor = vim.fn.getpos(".")
      if vim.v.event.operator == "y" then
        vim.fn.setpos(".", cursor_pos)
      end
    end,
  },
}

for group, commands in pairs(augroups) do
  local augroup = vim.api.nvim_create_augroup("AU_" .. group, { clear = true })

  for _, opts in pairs(commands) do
    local event = opts.event
    opts.event = nil
    opts.group = augroup
    vim.api.nvim_create_autocmd(event, opts)
  end
end
