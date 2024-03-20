local ok, dap = pcall(require, 'dap')
if not ok then
    return
end

--
-- See
-- https://sourceware.org/gdb/current/onlinedocs/gdb.html/Interpreters.html
-- https://sourceware.org/gdb/current/onlinedocs/gdb.html/Debugger-Adapter-Protocol.html
dap.adapters.gdb = {
    id = 'gdb',
    type = 'executable',
    command = 'gdb',
    args = { '--quiet', '--interpreter=dap' },
}

dap.configurations.c = {
    {
        name = 'Run executable (GDB)',
        type = 'gdb',
        request = 'launch',
        -- This requires special handling of 'run_last', see
        -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
        program = function()
            local path = vim.fn.input({
                prompt = 'Path to executable: ',
                default = vim.fn.getcwd() .. '/',
                completion = 'file',
            })

            return (path and path ~= '') and path or dap.ABORT
        end,
    },
    {
        name = 'Run executable with arguments (GDB)',
        type = 'gdb',
        request = 'launch',
        -- This requires special handling of 'run_last', see
        -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
        program = function()
            local path = vim.fn.input({
                prompt = 'Path to executable: ',
                default = vim.fn.getcwd() .. '/',
                completion = 'file',
            })

            return (path and path ~= '') and path or dap.ABORT
        end,
        args = function()
            local args_str = vim.fn.input({
                prompt = 'Arguments: ',
            })
            return vim.split(args_str, ' +')
        end,
    },
    {
        name = 'Attach to process (GDB)',
        type = 'gdb',
        request = 'attach',
        processId = require('dap.utils').pick_process,
    },
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.cpp

vim.keymap.set("n", "<F5>", function () dap.continue() end, { desc = "Dap continue" })
vim.keymap.set("n", "<F9>", function () dap.step_over() end, { desc = "Dap set over" })
vim.keymap.set("n", "<F8>", function () dap.step_into() end, { desc = "Dap set into" })
vim.keymap.set("n", "<F7>", function () dap.step_out() end, { desc = "Dap set out" })
vim.keymap.set("n", "<leader>b", function () dap.toggle_breakpoint() end, { desc = "Dap togle breakpoint" })

local  dapui = require("dapui")
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
if vim.fn.executable('gdb') == 1 then
       require('dap')
       require("dapui").setup()
end

