local function build()
	require("nvim-treesitter.install").update({ with_sync = true })
end

local function configuration()
	require 'nvim-treesitter.configs'.setup {
		-- A list of parser names, or "all" (the five listed parsers should always be installed)
		ensure_installed = { "c", "cpp", "rust", "lua", "bash", "python", "verilog" },
		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = false,

		highlight = {
			enable = true,

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},
	}
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = build,
	config = configuration,
	name = "Treesitter",
	event = "VeryLazy"
}