vim.cmd[[colorscheme palenight]]
vim.cmd[[highlight Normal guibg=NONE]]

vim.g.goyo_width = '80%'
vim.g.limelight_conceal_guifg = '#777777'
vim.api.nvim_exec([[
    function! s:goyo_enter()
        set noshowcmd
        set scrolloff=999
        set nocursorline
        Limelight
        echon ''
    endfunction
    function! s:goyo_leave()
        set showcmd
        set scrolloff=10
        set cursorline
        Limelight!
        highlight Normal guibg=NONE
    endfunction
    autocmd! user GoyoEnter nested call <SID>goyo_enter()
    autocmd! user GoyoLeave nested call <SID>goyo_leave()
]], true)

require('lualine').setup({
    options = {
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''}
    }
})
