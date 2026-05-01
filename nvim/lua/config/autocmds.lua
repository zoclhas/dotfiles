local augroups = {}

augroups.insert_mode_relative_num = {
  enter = {
    event = "InsertEnter",
    pattern = "*",
    callback = function()
      vim.cmd([[ setlocal norelativenumber ]])
    end,
  },
  exit = {
    event = "InsertLeave",
    pattern = "*",
    callback = function()
      vim.cmd([[ setlocal number relativenumber ]])
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
