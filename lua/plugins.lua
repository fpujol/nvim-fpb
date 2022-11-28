-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
  })
  vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Add Colors
  --use { 'rose-pine/neovim', config = "vim.cmd('colorscheme rose-pine')" }
  use { "catppuccin/nvim", as = "catppuccin",  config = "vim.cmd('colorscheme catppuccin')" }
  -- Syntax Highliter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ":TSUpdate",
      event = "BufWinEnter",
      config = "require('treesitter-config')"
  }
  -- Status bar
  use {
      'tamton-aquib/staline.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      event = "BufRead",
      config = "require('staline-config')"
  }
  -- Buffer line with tabs
  use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      event = "BufWinEnter",
      config = "require('bufferline-config')"
  }
  -- File Explorer
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'nvim-tree/nvim-web-devicons',
      cmd = "NvimTreeToggle",
      config = "require('nvim-tree-config')"
  }
  --Which key
  use { 'folke/which-key.nvim', event = "BufWinEnter", config = "require('whichkey-config')" }
  -- Telescope
  use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' } },
      cmd = "Telescope",
      config = "require('telescope-config')"
  }
  -- Lsp
  use { 'williamboman/nvim-lsp-installer' }
  use { 'neovim/nvim-lspconfig', config = "require('lsp')" }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'onsails/lspkind-nvim' }
  --Null-ls
  --use { 'jose-elias-alvarez/null-ls.nvim', config = "require('null-ls-config')" }
  use {'fatih/vim-go'}
  -- Debugging
  --use {'puremourning/vimspector'}
  -- vimspector
  --use {
  -- "puremourning/vimspector",
  --cmd = { "VimspectorInstall", "VimspectorUpdate" },
   --fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
   --config = function()
   -- require("vimspector-config").setup()
   --end,
  --}
  use {
      "mfussenegger/nvim-dap",
      opt = true,
      event = "BufReadPre",
      module = { "dap" },
      wants = { "nvim-dap-virtual-text", "nvim-dap-ui", "nvim-dap-python","nvim-dap-go", "which-key.nvim","nvim-dap-csharp" },
      requires = {
        --"Pocco81/DAPInstall.nvim",
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
          "mfussenegger/nvim-dap-python",
          "nvim-telescope/telescope-dap.nvim",
          { "leoluz/nvim-dap-go", module = "dap-go" },
          { "jbyuki/one-small-step-for-vimkind", module = "osv" },
        },
        config = function()
          require("dap-config").setup()
        end,
      }
  -- Test
  use {
      "nvim-neotest/neotest",
      opt = true,
      wants = {
        "plenary.nvim",
        "nvim-treesitter",
        "neotest-python",
        "neotest-plenary",
        "neotest-go",
        "neotest-jest",
        "neotest-vim-test",
        "neotest-rust",
        "vim-test",
        "overseer.nvim",
      },
      requires = {
        "vim-test/vim-test",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-go",
        "haydenmeade/neotest-jest",
        "nvim-neotest/neotest-vim-test",
        "rouge8/neotest-rust",
      },
      module = { "neotest", "neotest.async" },
      cmd = {
        "TestNearest",
        "TestFile",
        "TestSuite",
        "TestLast",
        "TestVisit",
      },
      config = function()
        require("config.neotest").setup()
      end,
      disable = false,
    }
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup { current_line_blame = true }
      end
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = "require('blankline-config')",
      event = "BufRead"
    }
    use { "akinsho/toggleterm.nvim", config = "require('toggleterm-config')" }
    use { "terrortylor/nvim-comment", config = "require('comment-config')" }
    use { 'tami5/lspsaga.nvim', config = "require('lspsaga-config')" }
    --use { 'williamboman/nvim-lsp-installer' }
    --use { 'jose-elias-alvarez/null-ls.nvim', config = "require('null-ls-config')" }
    use { "folke/zen-mode.nvim", config = 'require("zen-mode-config")' }
    use { "folke/twilight.nvim", config = "require('twilight-config')" }
    use { 'andweeb/presence.nvim', config = "require('presence-config')" }
end)
