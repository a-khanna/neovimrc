return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "[A]dd to Harpoon" })
        vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end, { desc = "[R]emove from Harpoon"})
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Harpoon Menu" })

        --vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        --vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
        --vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
        --vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<Tab>", function() harpoon:list():next() end, { desc = "Next Buffer" })
        vim.keymap.set("n", "<S-Tab>", function() harpoon:list():prev() end, { desc = "Previous Buffer" })
    end
}
