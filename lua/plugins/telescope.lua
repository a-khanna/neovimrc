return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind [F]iles" })
        vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "[F]ind [G]it files" })
        vim.keymap.set('n', '<leader>fd', function()
            builtin.grep_string({ search = vim.fn.input("Find (grep) > ")})
        end, { desc = "Find string (grep)" })
        vim.keymap.set('n', '<leader>fw', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "Find current word (grep)" })
    end
}
