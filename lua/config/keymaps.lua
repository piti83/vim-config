local keymap = vim.keymap

-- ==========================================
-- GENERAL & NAVIGATION
-- ==========================================
keymap.set("n", "<leader>h", "<cmd>noh<CR>", { desc = "Clear search highlight" })

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- ==========================================
-- BUFFER MANAGEMENT
-- ==========================================
keymap.set("n", "[b", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "]b", ":bnext<CR>", { desc = "Next buffer" })
-- Close buffer without closing the window (preserves layout)
keymap.set("n", "<leader>c", "<cmd>bprevious <bar> bdelete #<CR>", { desc = "Close current buffer" })

-- ==========================================
-- FILE EXPLORER (Oil)
-- ==========================================
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory (Oil)" })

-- ==========================================
-- TELESCOPE (Fuzzy Finder)
-- ==========================================
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep (search text)' })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find in open buffers' })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzy find in current buffer' })

-- ==========================================
-- LSP & FORMATTING (Conform)
-- ==========================================
keymap.set({ "n", "v" }, "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Find document symbols' })
keymap.set('n', '<leader>fS', builtin.lsp_dynamic_workspace_symbols, { desc = 'Find workspace symbols' })
keymap.set('n', 'gr', builtin.lsp_references, { desc = 'LSP: Go to references' })
keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'LSP: Go to implementation' })
keymap.set('n', 'go', builtin.lsp_type_definitions, { desc = 'LSP: Go to type definition' })

-- Dynamic LSP keymaps (attached only when LSP server is active for the buffer)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'LSP: Go to definition' })
    keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'LSP: Show documentation (Hover)' })
    keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'LSP: Rename symbol' })
  end,
})
