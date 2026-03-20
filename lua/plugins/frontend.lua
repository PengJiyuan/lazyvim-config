local function with_snacks(fn)
  return function()
    local ok, snacks = pcall(require, "snacks")
    if ok then
      fn(snacks)
    end
  end
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {},
        tailwindcss = {},
        html = {},
        cssls = {},
        jsonls = {},
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "javascript",
        "html",
        "css",
        "scss",
        "json",
        "jsonc",
        "yaml",
        "markdown",
        "markdown_inline",
        "bash",
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = true,
      },
      picker = {
        sources = {
          explorer = {
            layout = {
              layout = {
                position = "left",
                width = 32,
              },
            },
            hidden = true,
            ignored = true,
            auto_close = false,
          },
        },
      },
    },
    keys = {
      { "<C-p>", with_snacks(function(snacks) snacks.picker.files() end), desc = "Find Files" },
      { "<D-p>", with_snacks(function(snacks) snacks.picker.commands() end), desc = "Command Palette" },
      { "<leader><leader>", with_snacks(function(snacks) snacks.picker.buffers() end), desc = "Buffers" },
      { "<leader>fe", with_snacks(function(snacks) snacks.explorer() end), desc = "File Explorer" },
      { "<leader>fr", with_snacks(function(snacks) snacks.picker.recent() end), desc = "Recent Files" },
      { "<leader>f,", with_snacks(function(snacks) snacks.picker.lsp_symbols() end), desc = "Document Symbols" },
      { "<leader>f<", with_snacks(function(snacks) snacks.picker.lsp_workspace_symbols() end), desc = "Workspace Symbols" },
      { "<leader>xp", "<cmd>Trouble diagnostics toggle<cr>", desc = "Problems" },
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },
}
