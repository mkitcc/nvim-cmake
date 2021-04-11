lua << EOF
--vim.cmd "command! Build lua require'cmake-build'.build()"
vim.api.nvim_set_keymap('n','<Leader>r',":lua require'nvim-cmake'.build()<Enter>",{noremap = true,nowait =true})
EOF

