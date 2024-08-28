return {
    {
        "Zeioth/compiler.nvim",
        cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
        dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
        keys = {
            { "<F6>", "<cmd>CompilerOpen<CR>", { noremap = true, silent = true, desc = "CompilerOpen" } },
            { "<S-F6>", "<cmd>CompilerRedo<CR>", { noremap = true, silent = true, desc = "CompilerRedo" } },
            { "<S-F7>", "<cmd>CompilerToggleResults<CR>", { noremap = true, silent = true, desc = "CompilerRedo" } },
        },
        opts = {}
    },
    {
        "stevearc/overseer.nvim",
        commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 25,
                default_detail = 1
            },
        },
    }
}
