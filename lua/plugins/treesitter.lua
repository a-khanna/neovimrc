return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c_sharp", "go", "html", "javascript", "lua", "python" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
 }
