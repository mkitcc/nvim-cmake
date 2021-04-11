
local build_dir = 'build'
local current_dir = "."
local target = "main"


local cmd = vim.cmd
local call = vim.api.nvim_call_function
local exec = vim.fn.systemlist
local luv = vim.loop


-- print string
local function echo(str)
    if type(str) == "string" then
        cmd("echo '"..str.."'")
    else
        for k,v in ipairs(str) do 
            cmd("echo '"..v.."'")
        end
    end
end

-- Running Target 
local function run(result)
    local mTarget = nil
    for k,v in pairs(result) do
        local a,b = string.find(v,"Built target")
        if a ~= nil then 
            mTarget = string.sub(v,b+2)
        end
    end
    local prog = '!./'..build_dir.."/"..mTarget
    cmd(prog)
end

-- Find Build directory
local function checkCMakeList()
    if  luv.fs_access("CMakeLists.txt","r") ~= true then
        echo("CMakeLIst.txt is not exist")
        return false
    end
    return true
end

-- Build Target
local function build()
    if not checkCMakeList() then
        return
    end

    local para = 'cmake -S . '..'-B '..build_dir
    local result = exec(para)
    echo(result)
    para = 'cmake --build '..'./'..build_dir .. ' --target all'
    result = exec(para)
    echo(result)
    run(result)
end


return {
    build = build
}
