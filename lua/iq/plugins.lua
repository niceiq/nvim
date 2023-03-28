local fn = vim.fn

-- Automatically install Packer --
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print("Installing packer close and reopen Neovim...")
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads Neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "rounded"}
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions use by lots of plugins
  
  -- Markdown 
  use {"iamcco/markdown-preview.nvim", run = 'cd app && npm install', cmd = 'MarkdownPreview'}
  
  -- Colorschemes
  use "sainnhe/everforest"

  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"} -- Syntax Highlighting

  -- Completion
  use "hrsh7th/nvim-cmp" -- completion plugin
  use "hrsh7th/cmp-buffer" -- adds buffer completion
  use "hrsh7th/cmp-path" -- add path completion
  use "hrsh7th/cmp-cmdline" -- adds command line completion
  use "hrsh7th/cmp-nvim-lsp" -- adds LSP completion
  use "saadparwaiz1/cmp_luasnip" -- adds snippet completion

  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- lots of community snippets

  -- navigation
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"

  use "nvim-telescope/telescope.nvim" -- Extensible fuzzy-finder
  use "nvim-telescope/telescope-media-files.nvim" -- View media files is Telescope

  -- LSP
  use {"VonHeikemen/lsp-zero.nvim"}
  use {"williamboman/mason.nvim", run = ":MasonUpdate"} -- LSP Installer
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig" -- This enables LSP

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
