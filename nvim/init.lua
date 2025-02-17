
vim.g.mapleader = " "

-- Set tab width
vim.opt.tabstop = 4        -- Number of spaces a tab represents
vim.opt.shiftwidth = 4     -- Number of spaces for autoindent
vim.opt.expandtab = true   -- Convert tabs to spaces instead of using tab characters


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
  -- VS Code Theme
  { "Mofiqul/vscode.nvim" },

  -- File Explorer (like VS Code sidebar)
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Statusline (bottom bar)
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Tabs (like VS Code tabs)
  { "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Fuzzy Finder (Ctrl+P style file search)
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- LSP (like IntelliSense in VS Code)
  { "neovim/nvim-lspconfig" },

  -- Auto-completion
  { "hrsh7th/nvim-cmp", dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip"
    }
  },

  -- Auto-updating imports on rename
  { "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Git signs (VS Code-like Git decorations)
  { "lewis6991/gitsigns.nvim" },

  -- Better syntax highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
})
