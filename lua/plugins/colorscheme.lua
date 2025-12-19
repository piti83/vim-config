return {
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000, 
    config = function()
      vim.opt.background = "dark"
      vim.cmd("colorscheme oxocarbon")

      local groups = {
        "Normal",   
        "NormalNC",  
        "NormalFloat",
        "FloatBorder",
        "SignColumn", 
        "LineNr",      
        "CursorLineNr", 
        "EndOfBuffer",   

        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "NvimTreeWinSeparator",
        "TelescopeNormal",
        "TelescopeBorder",
      }

      for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
      end
    end,
  },
}
