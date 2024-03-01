local Util = require 'util'

return { -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    branch = '0.1.x',
    keys = {
      { '<leader>/', Util.telescope 'live_grep', desc = 'Grep (root dir)' },
      { '<leader>:', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
      { '<leader><space>', Util.telescope 'files', desc = 'Find Files (root dir)' },
      -- Files
      { '<leader>fb', '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>', desc = 'Buffers' },
      { '<leader>fc', Util.telescope.config_files(), desc = 'Find Config File' },
      { '<leader>ff', Util.telescope 'files', desc = 'Find Files (root dir)' },
      { '<leader>fF', Util.telescope('files', { cwd = false }), desc = 'Find Files (cwd)' },
      { '<leader>fg', '<cmd>Telescope git_files<cr>', desc = 'Find Files (git-files)' },
      { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent' },
      { '<leader>fR', Util.telescope('oldfiles', { cwd = vim.loop.cwd() }), desc = 'Recent (cwd)' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',

        build = 'make',

        cond = function()
          return vim.fn.executable 'make' == 1
        end,
        config = function()
          Util.on_load('telescope.nvim', function()
            require('telescope').load_extension 'fzf'
          end)
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
        pickers = {
          oldfiles = { cwd_only = true },
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      -- vim.keymap.set('n', '<leader>fr', builtin.oldfiles)
      -- vim.keymap.set('n', '<leader>fR', builtin.oldfiles)
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>?', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
