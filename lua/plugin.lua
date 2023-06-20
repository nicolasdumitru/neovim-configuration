-- Plugin configuration

-- Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Lazy remaps
vim.keymap.set("n", "<leader>pm", vim.cmd.Lazy)

-- Lazy plugins
require("lazy").setup({
	-- Gruvbox theme
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000
	},
	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {"nvim-tree/nvim-web-devicons"}
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	-- LSP Zero
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{"neovim/nvim-lspconfig"},             -- Required
			{                                      -- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{"williamboman/mason-lspconfig.nvim"}, -- Optional
			-- Autocompletion
			{"hrsh7th/nvim-cmp"},     -- Required
			{"hrsh7th/cmp-nvim-lsp"}, -- Required
			{"L3MON4D3/LuaSnip"},     -- Required
		}
	},
	-- Fugitive
	{"tpope/vim-fugitive"},
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {"nvim-lua/plenary.nvim"}
	},
	-- Autoclose
	{"m4xshen/autoclose.nvim"},
	-- Toggleterm
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true
	},
})

-- Gruvbox theme options
-- Setup must be called before loading the colorscheme
require("pluginconfig.gruvbox-config")

-- Set the theme
vim.cmd("colorscheme gruvbox")

-- Lualine setup
require("pluginconfig.lualine-config")

-- Treesitter setup
require("pluginconfig.treesitter-config")

-- LSP (LSP Zero) setup
require("pluginconfig.lsp-zero-config")

-- Autoclose setup
require("pluginconfig.autoclose-config")

-- Telescope remaps
require("pluginconfig.telescope-remap")

-- Toggleterm setup
require("pluginconfig.toggleterm-config")
