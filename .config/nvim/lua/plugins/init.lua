local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    --MY PLUGINS HERE!

    use {'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons',}, config = function() require'nvim-tree'.setup {} end}
    use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
    use {'folke/tokyonight.nvim'}
    use {"ellisonleao/gruvbox.nvim" }
    use {'windwp/nvim-ts-autotag'}
    use {'p00f/nvim-ts-rainbow'}
    use {'windwp/nvim-autopairs'}
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use {'terrortylor/nvim-comment'}
    use {"lukas-reineke/indent-blankline.nvim"}
    use {'phaazon/hop.nvim', as = 'hop', config = function() require('hop') end}
    use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}
    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer',}
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {"saadparwaiz1/cmp_luasnip"}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {"hrsh7th/cmp-nvim-lua"}
    use {'L3MON4D3/LuaSnip'}
    use {'rafamadriz/friendly-snippets'}
    use {'andweeb/presence.nvim'}
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use {'kshenoy/vim-signature'}
    use {'mg979/vim-visual-multi'}
    use {"tpope/vim-surround"}
    use {'glepnir/dashboard-nvim'}
    use {'andymass/vim-matchup'}
    use {"norcalli/nvim-colorizer.lua"}

    --automatic configure after clone packer.nvim
    --put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
