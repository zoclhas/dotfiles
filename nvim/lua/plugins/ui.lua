return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      { "<b", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { ">b", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    },
    opts = {
      options = {
        separator_style = "slant",
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
    config = function()
      local theme = require("kanagawa.colors").setup().theme

      require("lualine").setup({
        options = {
          -- theme = "kanagawa1",
          component_separators = "",
          -- section_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          theme = "iceberg_dark",
          -- theme = {
          --   normal = {
          --     a = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
          --     b = { bg = theme.diff.change, fg = theme.syn.fun },
          --     c = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
          --   },
          --   insert = {
          --     a = { bg = theme.diag.ok, fg = theme.ui.bg },
          --     b = { bg = theme.ui.bg, fg = theme.diag.ok },
          --   },
          --   command = {
          --     a = { bg = theme.syn.operator, fg = theme.ui.bg },
          --     b = { bg = theme.ui.bg, fg = theme.syn.operator },
          --   },
          --   visual = {
          --     a = { bg = theme.syn.keyword, fg = theme.ui.bg },
          --     b = { bg = theme.ui.bg, fg = theme.syn.keyword },
          --   },
          --   replace = {
          --     a = { bg = theme.syn.constant, fg = theme.ui.bg },
          --     b = { bg = theme.ui.bg, fg = theme.syn.constant },
          --   },
          --   inactive = {
          --     a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          --     b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = "bold" },
          --     c = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          --   },
          -- },
        },
        sections = {
          lualine_c = {
            "lsp_progress",
            {
              "filename",
              path = 1,
            },
          },
          lualine_z = { "location" },
        },
      })
    end,
  },

  {
    "nvimdev/dashboard-nvim",
    opts = function()
      local logo = [[
  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
 ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
 ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██
 ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
 ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
 ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░
          ░    ░  ░    ░ ░        ░   ░         ░
                                 ░
]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- open dashboard after closing lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },

  {
    "edluffy/hologram.nvim",
    config = function()
      require("hologram").setup({
        -- auto_display = true,
      })
    end,
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup()
    end,
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      vim.diagnostic.config({ virtual_lines = false })
    end,
  },

  -- {
  --   "shellRaining/hlchunk.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require("hlchunk").setup({
  --       chunk = {
  --         enable = true,
  --       },
  --       line_num = {
  --         enable = true,
  --       },
  --     })
  --   end,
  -- },
}
