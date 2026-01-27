-- Add support for Arduino

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "arduino",
        "c",
        "cpp",
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "arduino-language-server",
        "clangd",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        arduino_language_server = {
          cmd = { "arduino-language-server", "-cli-config=$HOME/Library/Arduino15/arduino-cli.yaml" },
        },
      },
    },
  },
}
