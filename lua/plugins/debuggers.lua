local function ConfigureDapUi()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
    end
end

local function ConfigureKeyBindings()
    local dap, dapui = require("dap"), require("dapui")
    -- vim.keymap.set("n", "<Leader>dt", ":DapUiToggle<CR>", { desc = "Toggle Debugger UI" })
    vim.keymap.set("n", "<Leader>br", dap.toggle_breakpoint, { desc = "Toggle [B]reakpoint" })
    vim.keymap.set("n", "<Leader>bc",
        function()
            vim.ui.input({ prompt = "Condition: " }, function(condition)
                if condition then dap.set_breakpoint(condition) end
            end)
        end,
        { desc = "Conditional Breakpoint" })
    vim.keymap.set("n", "<Leader>Br", dap.clear_breakpoints, { desc = "Clear [B]reakpoints" })
    -- Eval var under cursor
    vim.keymap.set("n", "<Leader>?", function() dapui.eval(nil, { enter = true }) end, { desc = "Eval under cursor" })
    vim.keymap.set("n", "<Leader>??",
        function()
            vim.ui.input({ prompt = "Expression: " }, function(expr)
                if expr then dapui.eval(expr, { enter = true }) end
            end)
        end,
        { desc = "Evaluate expression" })
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debugger: Continue" })
    vim.keymap.set("n", "<F5>", dap.terminate, { desc = "Debugger: Stop" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debugger: Step into" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debugger: Step over" })
    vim.keymap.set("n", "<S-F11>", dap.step_out, { desc = "Debugger: Step out" })
    vim.keymap.set("n", "<C-F5>", dap.restart, { desc = "Debugger: Restart" })

    vim.keymap.set("n", "<Leader>dr", ":lua require('dapui').open({reset = true})<CR>", { desc = "Reset Debugger UI" })
end

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
            {"theHamsta/nvim-dap-virtual-text", opts = {}},
			{"leoluz/nvim-dap-go", opts = {}},
			"nvim-neotest/nvim-nio",
		},

		config = function()
            ConfigureDapUi()
            ConfigureKeyBindings()
            local dap = require("dap")

            -- C#
            dap.adapters.coreclr = {
                type = 'executable',
                command = vim.fn.stdpath('data') .. '/mason/bin/netcoredbg',
                args = { '--interpreter=vscode' }
            }
            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function() -- Ask the user what executable wants to debug
                        return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Program.exe', 'file')
                    end,
                },
            }

            vim.fn.sign_define(
                "DapBreakpoint",
                { text = "⏺", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
            )
        end,
    },
    --{
    --	"mfussenegger/nvim-dap-python",
    --	ft = "python",
    --	dependencies = {
    --		"mfussenegger/nvim-dap",
    --	},
    --	config = function()
    --        ConfigureDapUi()
    --        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3"
    --        require("dap-python").setup(path)
    --    end,
    --},
}
