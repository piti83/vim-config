local keymap = vim.keymap

keymap.set("n", "<leader>h", "<cmd>noh<CR>", { desc = "Wyczyść podświetlenie wyszukiwania" })

keymap.set("n", "[b", ":bprevious<CR>", { desc = "Poprzedni bufor" })
keymap.set("n", "]b", ":bnext<CR>", { desc = "Następny bufor" })


keymap.set("n", "<leader>c", function()
  vim.cmd("bdelete")

  local current_buf = vim.api.nvim_get_current_buf()
  local current_ft = vim.api.nvim_get_option_value('filetype', { buf = current_buf })

  if current_ft == 'NvimTree' then
    vim.cmd("bnext")

    local after_bnext_buf = vim.api.nvim_get_current_buf()
    local after_bnext_ft = vim.api.nvim_get_option_value('filetype', { buf = after_bnext_buf })

    if after_bnext_ft == 'NvimTree' then
      vim.cmd("enew") 
    end
  end
end, { desc = "Zamknij bufor" })

-- Nvim-Tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Pokaż/Ukryj eksplorator plików" })
keymap.set("n", "<C-h>", function() vim.cmd.wincmd("h") end, { desc = "Idź do okna po lewej" })
keymap.set("n", "<C-l>", function() vim.cmd.wincmd("l") end, { desc = "Idź do okna po prawej" })

-- Telescope 
keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Szukaj plików' })
keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Szukaj tekstu w projekcie' })
keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Szukaj w otwartych buforach' })
keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Szukaj w pomocy' })

keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'Szukaj w bieżącym pliku' })

-- Conform
keymap.set({ "n", "v" }, "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Formatuj plik" })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    keymap.set('n', '<S-gd>', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'LSP: Idź do definicji' })
  end,
})

keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
