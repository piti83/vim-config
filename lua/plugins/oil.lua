return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
    })
    -- Zamiast otwierać drzewo z boku, otwiera katalog w obecnym oknie
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Otwórz folder nadrzędny" })
  end,
}
