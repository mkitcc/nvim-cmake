
local build_dir = 'build'
local cmd = vim.cmd
local call = vim.api.nvim_call_function
local exec = vim.fn.system

--cmake -S /home/kevin/workspace/c_test -B /home/kevin/workspace/c_test/build
local function run()
    local prog = '!./'..build_dir
    prog = prog..'/main'
    cmd(prog)
end

local function build()
    local para = 'cmake -S . '..'-B '..build_dir
    local result = exec(para)
    cmd('echo "'..result..'"')
    para = 'cmake --build '..'./'..build_dir .. ' --target all'
    result = exec(para)
    cmd('echo "'..result..'"')
    run()
end


return {
    build = build
}
