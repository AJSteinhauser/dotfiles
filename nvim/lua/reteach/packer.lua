-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself

  use {'kevinhwang91/nvim-bqf'}
  use {'junegunn/fzf', run = function()
          vim.fn['fzf#install']()
      end
    }
  use { "0oAstro/dim.lua",
      requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
      config = function()
          require('dim').setup({})
      end
  }
  use { "rcarriga/nvim-dap-ui",
      requires = {
          "mfussenegger/nvim-dap",
          "nvim-neotest/nvim-nio",
          "rcarriga/nvim-dap-ui",
          "theHamsta/nvim-dap-virtual-text"
      }
  }
  use { "tpope/vim-dadbod",
      requires = {
          "kristijanhusak/vim-dadbod-completion",
          "kristijanhusak/vim-dadbod-ui",
      }
  }
  use {'dstein64/vim-startuptime'}
  use {'RRethy/nvim-base16'}
  use {'lambdalisue/glyph-palette.vim'}
  use {'nvim-tree/nvim-web-devicons'}
  use {'chentoast/marks.nvim', config = function() require('marks').setup({default_mappings = true}) end}
  use {
      ('Exafunction/codeium.vim'),
      config = function ()
          -- Change '<C-g>' here to any keycode you like.
          vim.keymap.set('i', '<c-l>', function () return vim.fn['codeium#Accept']() end, { expr = true })
          vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
          vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
          vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      end
  }
  use({'lewis6991/gitsigns.nvim',config = function() require('gitsigns').setup() end})
  use 'APZelos/blamer.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
  end}
  use({"terrortylor/nvim-comment", config = function() require('nvim_comment').setup() end})
  use "lukas-reineke/indent-blankline.nvim"
  use 'wbthomason/packer.nvim'
  use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }
  use { 'joeveiga/ng.nvim'}
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim','sharkdp/fd'} }
  }
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', commit="a8535b2"})
  use({'folke/trouble.nvim', commit='2ea761f'})
  use({ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" })
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine', 
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use{'sjl/vitality.vim'}
  use('tpope/vim-fugitive')
  use{'lambdalisue/fern.vim'}
  use{'hrsh7th/cmp-cmdline'}
  use{'dusans/vim-hardmode'}
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use({"iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
              'williamboman/mason.nvim',
              run = function()
                  pcall(vim.api.nvim_command, 'MasonUpdate')
              end,
          },
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'}     -- Required
      }
    }
    use{'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end}
end)
