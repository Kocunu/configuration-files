-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    vim.cmd('colorscheme default')
    use "catppuccin/nvim"
    use 'letorbi/vim-colors-modern-borland'
    use "bluz71/vim-moonfly-colors"

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use( 'nvim-treesitter/playground')
    -- Autocompletion--
    use('nvim-lua/completion-nvim')
    use 'm4xshen/autoclose.nvim'
    -- LSP Zero --
    
    -- Gruvbox Theme
    use { "ellisonleao/gruvbox.nvim" }

    -- Rust-tools
    use {"simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
        return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
        require('rust-tools').setup(opts)
    end}

    use 'mfussenegger/nvim-dap'

    -- Markdown Preview

    use 'davidgranstrom/nvim-markdown-preview'
    use 'lervag/vimtex'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    }
}

end)
