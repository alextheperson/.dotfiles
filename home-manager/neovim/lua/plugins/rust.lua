-- Add support for rust

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "rust",
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "ast-grep",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {},
    },
  },
}
