vim.cmd "command! CmakeBuild lua require'nvim-cmake'.build()"
vim.api.nvim_set_keymap('n','<Leader>r',":lua require'nvim-cmake'.build()<Enter>",{noremap = true,nowait =true})

