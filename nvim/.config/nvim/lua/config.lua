-- Load theme
vim.cmd("colorscheme vscode")

-- Configure file explorer (toggle with <leader>e)
require("nvim-tree").setup()
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Configure statusline
require("lualine").setup({ options = { theme = "vscode" } })

-- Configure tabline
require("bufferline").setup()

-- Configure fuzzy finder
require("telescope").setup()
vim.keymap.set("n", "<leader>p", ":Telescope find_files<CR>")

-- Configure LSP
local lspconfig = require("lspconfig")
lspconfig.tsserver.setup({})  -- JavaScript & TypeScript support
lspconfig.pyright.setup({})   -- Python support
lspconfig.lua_ls.setup({})    -- Lua support

-- Auto-completion
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" }
  }),
})

-- Auto-fix imports on rename
local null_ls = require("null-ls")
null_ls.setup({ sources = { null_ls.builtins.formatting.prettier } })

