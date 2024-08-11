return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        -- will wait 500ms after you press <leader> (for example) and show you suggestions
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {}
}
