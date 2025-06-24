return {
  {
    "saghen/blink.cmp",
    version = not vim.g.lazyvim_blink_main and "*",
    build = vim.g.lazyvim_blink_main and "cargo build --release",
    opts_extend = {
      "sources.completion.enabled_providers",
      "sources.compat",
      "sources.default",
    },
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- add blink.compat to dependencies
      {
        "saghen/blink.compat",
        optional = true, -- make optional so it's only enabled if any extras need it
        opts = {},
        version = not vim.g.lazyvim_blink_main and "*",
      },
      { "L3MON4D3/LuaSnip", version = "v2.*" },
    },
    event = "InsertEnter",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      snippets = {
        expand = function(snippet)
          require("luasnip").lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require("luasnip").jumpable(filter.direction)
          end
          return require("luasnip").in_snippet()
        end,
        jump = function(direction)
          require("luasnip").jump(direction)
        end,
      },
      appearance = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = false,
        -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },
      completion = {
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          -- enabled = vim.g.ai_cmp,
        },
      },

      -- experimental signature help support
      -- signature = { enabled = true },

      sources = {
        -- adding any nvim-cmp sources here will enable them
        -- with blink.compat
        compat = {},
        default = { "lsp", "path", "snippets", "buffer" },
        cmdline = {},
      },

      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_and_accept" },
        -- ["<CR>"] = { "" },
      },
    },
    ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
    config = function(_, opts)
      -- setup compat sources
      local enabled = opts.sources.default
      for _, source in ipairs(opts.sources.compat or {}) do
        opts.sources.providers[source] = vim.tbl_deep_extend(
          "force",
          { name = source, module = "blink.compat.source" },
          opts.sources.providers[source] or {}
        )
        if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
          table.insert(enabled, source)
        end
      end

      local ls = require("luasnip")

      vim.keymap.set({ "i" }, "<C-K>", function()
        ls.expand()
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-L>", function()
        ls.jump(1)
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-H>", function()
        ls.jump(-1)
      end, { silent = true })

      -- -- add ai_accept to <Tab> key
      -- if not opts.keymap["<Tab>"] then
      --   if opts.keymap.preset == "super-tab" then -- super-tab
      --     opts.keymap["<Tab>"] = {
      --       function(cmp)
      --         if cmp.snippet_active() then
      --           return cmp.accept()
      --         else
      --           return cmp.select_and_accept()
      --         end
      --       end,
      --       LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
      --       "fallback",
      --     }
      --   else -- other presets
      --     opts.keymap["<Tab>"] = {
      --       LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
      --       "fallback",
      --     }
      --   end
      -- end

      -- Unset custom prop to pass blink.cmp validation
      opts.sources.compat = nil

      -- check if we need to override symbol kinds
      for _, provider in pairs(opts.sources.providers or {}) do
        ---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
        if provider.kind then
          local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
          local kind_idx = #CompletionItemKind + 1

          CompletionItemKind[kind_idx] = provider.kind
          ---@diagnostic disable-next-line: no-unknown
          CompletionItemKind[provider.kind] = kind_idx

          ---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
          local transform_items = provider.transform_items
          ---@param ctx blink.cmp.Context
          ---@param items blink.cmp.CompletionItem[]
          provider.transform_items = function(ctx, items)
            items = transform_items and transform_items(ctx, items) or items
            for _, item in ipairs(items) do
              item.kind = kind_idx or item.kind
            end
            return items
          end

          -- Unset custom prop to pass blink.cmp validation
          provider.kind = nil
        end
      end

      require("blink.cmp").setup(opts)
    end,
  },
  "rafamadriz/friendly-snippets",
  -- add blink.compat to dependencies
  {
    "saghen/blink.compat",
    optional = true, -- make optional so it's only enabled if any extras need it
    opts = {},
    version = not vim.g.lazyvim_blink_main and "*",
  },
}

-- local kind_icons = {
--   Text = "",
--   Method = "󰆧",
--   Function = "󰊕",
--   Constructor = "",
--   Field = "󰇽",
--   Variable = "󰂡",
--   Class = "󰠱",
--   Interface = "",
--   Module = "",
--   Property = "󰜢",
--   Unit = "",
--   Value = "󰎠",
--   Enum = "",
--   Keyword = "󰌋",
--   Snippet = "",
--   Color = "󰏘",
--   File = "󰈙",
--   Reference = "",
--   Folder = "󰉋",
--   EnumMember = "",
--   Constant = "󰏿",
--   Struct = "",
--   Event = "",
--   Operator = "󰆕",
--   TypeParameter = "󰅲",
-- }
--
-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     version = false,
--     event = "InsertEnter",
--     dependencies = {
--       "hrsh7th/cmp-nvim-lsp",
--       "hrsh7th/cmp-buffer",
--       "hrsh7th/cmp-path",
--       {
--         "L3MON4D3/LuaSnip",
--         build = (function()
--           if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
--             return
--           end
--           return "make install_jsregexp"
--         end)(),
--       },
--       "saadparwaiz1/cmp_luasnip",
--     },
--     opts = function()
--       vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
--       local cmp = require("cmp")
--       local defaults = require("cmp.config.default")()
--       local auto_select = true
--
--       local luasnip = require("luasnip")
--       luasnip.config.setup({})
--
--       vim.cmd([[
--         highlight! Pmenu guibg=#12140f
--       ]])
--
--       return {
--         auto_brackets = {}, -- configure any filetype to auto add brackets
--         completion = {
--           completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
--         },
--         snippet = {
--           expand = function(args)
--             luasnip.lsp_expand(args.body)
--           end,
--         },
--         preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
--         mapping = cmp.mapping.preset.insert({
--           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--           ["<C-f>"] = cmp.mapping.scroll_docs(4),
--           ["<C-Space>"] = cmp.mapping.complete(),
--           ["<Tab>"] = LazyVim.cmp.confirm({ select = auto_select }),
--           ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
--           ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--           ["<C-CR>"] = function(fallback)
--             cmp.abort()
--             fallback()
--           end,
--           ["<C-l>"] = cmp.mapping(function()
--             if luasnip.expand_or_locally_jumpable() then
--               luasnip.expand_or_jump()
--             end
--           end, { "i", "s" }),
--           ["<C-h>"] = cmp.mapping(function()
--             if luasnip.locally_jumpable(-1) then
--               luasnip.jump(-1)
--             end
--           end, { "i", "s" }),
--         }),
--         sources = cmp.config.sources({
--           { name = "nvim_lsp", keyword_length = 1, max_item_count = 150 },
--           { name = "path" },
--         }, {
--           { name = "buffer" },
--         }),
--         experimental = {
--           ghost_text = {
--             hl_group = "CmpGhostText",
--           },
--         },
--         window = {
--           completion = {
--             scrollbar = "║",
--             winhighlight = "Normal:Pmenu",
--           },
--           documentation = {
--             scrollbar = "║",
--             winhighlight = "Normal:Pmenu",
--           },
--         },
--         formatting = {
--           fields = { "abbr", "kind", "menu" },
--           -- fields = { "kind", "abbr", "menu" },
--           format = function(entry, item)
--             item.menu = item.kind
--             item = require("nvim-highlight-colors").format(entry, item)
--             if kind_icons[item.kind] then
--               item.kind = kind_icons[item.kind] .. " "
--             end
--             return item
--           end,
--         },
--         sorting = defaults.sorting,
--       }
--     end,
--   },
--
--   {
--     "garymjr/nvim-snippets",
--     opts = {
--       friendly_snippets = true,
--     },
--     dependencies = { "rafamadriz/friendly-snippets" },
--   },
-- }
