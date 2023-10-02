return {
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    lazy = true,
    config = function()
      require("nvim-treesitter.configs").setup({
        refactor = {
          highlight_definitions = { enable = true },
          highlight_current_scope = { enable = true },
          navigation = {
            enable = true,
            keymaps = keymap.ts_refactor.navigate,
          },
          smart_rename = {
            enable = true,
            keymaps = keymap.ts_refactor.rename,
          },
        },
      })
    end,
  },
  -- rainbow parentheses with ts
  {
    "HiPhish/nvim-ts-rainbow2",
    lazy = true,
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          query = "rainbow-parens",
          strategy = require("ts-rainbow").strategy.global,
        },
      })
    end,
  },
}
