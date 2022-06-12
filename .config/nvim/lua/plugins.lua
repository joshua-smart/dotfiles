vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
    use 'junegunn/goyo.vim'
    use 'junegunn/limelight.vim'
    use 'yggdroot/indentline'
    use 'drewtempelmeyer/palenight.vim'
    use 'lewis6991/gitsigns.nvim'
    use 'williamboman/nvim-lsp-installer'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use 'Mofiqul/trld.nvim'
    use 'lewis6991/gitsigns.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
end)
