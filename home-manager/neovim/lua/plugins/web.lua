# Add Support for Web Languages (HTML, JS, CSS, JSON, TS, Svelte)

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "javascript",
        "css",
        "typescript",
        "svelte",
        "jsonc",
        "json5"
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "css-lsp",
        "css-variables-language-server",
        "typescript-language-server",
        "svelte-language-server"
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {},
        css_variables = {},
        ts_ls = {},
        svelte = {}
      },
    },
  },
}
