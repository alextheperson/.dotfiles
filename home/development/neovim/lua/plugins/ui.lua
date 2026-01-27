-- Configures the UI

return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
      },
    },
  },

  { "folke/which-key.nvim", opts = {
    preset = "modern",
  } },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "regex",
      },
    },
  },

  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[
     █████ █     ██                                                         
  ██████  ██    ████ █                                 █                    
 ██   █  █ ██    ████                    ██           ███                   
█    █  █  ██    █ █                     ██            █                    
    █  █    ██   █                ████    ██    ███                         
   ██ ██    ██   █       ███     █ ███  █  ██    ███ ███    ███ ████ ████   
   ██ ██     ██  █      █ ███   █   ████   ██     ███ ███    ███ ████ ███  █
   ██ ██     ██  █     █   ███ ██    ██    ██      ██  ██     ██  ████ ████ 
   ██ ██      ██ █    ██    █████    ██    ██      ██  ██     ██   ██   ██  
   ██ ██      ██ █    ████████ ██    ██    ██      ██  ██     ██   ██   ██  
   █  ██       ███    ███████  ██    ██    ██      ██  ██     ██   ██   ██  
      █        ███    ██       ██    ██    ██      █   ██     ██   ██   ██  
  ████          ██    ████    █ ██████      ███████    ██     ██   ██   ██  
 █  █████              ███████   ████        █████     ███ █  ███  ███  ███ 
█     ██                █████                           ███    ███  ███  ███
█                                                                           
 █                                                                          
  ██                                                                        
      ]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            -- { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            -- { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<Tab>"] = {
          require("blink.cmp.keymap.presets").get("super-tab")["<Tab>"][1],
          require("lazyvim.util.cmp").map({ "snippet_forward", "ai_accept" }),
          "fallback",
        },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "dictionary" },
        providers = {
          dictionary = {
            module = "blink-cmp-dictionary",
            name = "Dict",
            -- Make sure this is at least 2.
            -- 3 is recommended
            min_keyword_length = 4,
            opts = {
              dictionary_files = { vim.fn.expand("~/Assets/Dictionaries/en_us/words_alpha.txt") },
            },
          },
        },
      },
    },
    dependencies = {
      {
        "Kaiser-Yang/blink-cmp-dictionary",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
      -- ... Other dependencies
    },
  },
  { "lewis6991/satellite.nvim" },
  -- { "3rd/image.nvim" },
}
