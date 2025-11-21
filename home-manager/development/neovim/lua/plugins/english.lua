return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "harper-ls",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["harper_ls"] = {},
      },
    },
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,

    opts = {
      config = {
        latex = {
          enable = true,
          blocks = {
            enable = true,

            hl = "MarkviewCode",
            pad_char = " ",
            pad_amount = 0,

            text = " LaTeX ",
            text_hl = "MarkviewCodeInfo",
          },
          fonts = {
            enable = true,

            default = {
              enable = true,
              hl = "MarkviewSpecial",
            },

            mathbf = { enable = true },
            mathbfit = { enable = true },
            mathcal = { enable = true },
            mathbfscr = { enable = true },
            mathfrak = { enable = true },
            mathbb = { enable = true },
            mathbffrak = { enable = true },
            mathsf = { enable = true },
            mathsfbf = { enable = true },
            mathsfit = { enable = true },
            mathsfbfit = { enable = true },
            mathtt = { enable = true },
            mathrm = { enable = true },
          },
        },
      },
    },

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "markdown",
        "markdown_inline",
        "latex",
        "yaml",
      },
    },
  },
}
