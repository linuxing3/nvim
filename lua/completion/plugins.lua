local completion = {}

-- local conf = require("modules.completion.config")

-- lsp config
completion["neovim/nvim-lspconfig"] = {
	opt = true,
	event = "BufReadPre",
	-- config = conf.nvim_lsp,
}

-- formatter
completion["creativenull/efmls-configs-nvim"] = {
	opt = false,
	requires = "neovim/nvim-lspconfig",
}

-- lsp

completion["williamboman/nvim-lsp-installer"] = {
	opt = false,
}
-- completion["kevinhwang91/nvim-bqf"] = {
-- 	opt = true,
-- 	ft = "qf",
-- 	config = conf.bqf,
-- }

-- beautify lsp ui
completion["tami5/lspsaga.nvim"] = {
	opt = true,
	after = "nvim-lspconfig",
}
-- completion["stevearc/aerial.nvim"] = {
-- 	opt = true,
-- 	after = "nvim-lspconfig",
-- 	config = conf.aerial,
-- }
-- completion["kosayoda/nvim-lightbulb"] = {
-- 	opt = true,
-- 	after = "nvim-lspconfig",
-- 	config = conf.lightbulb,
-- }

completion["ray-x/lsp_signature.nvim"] = { opt = true, after = "nvim-lspconfig" }
completion["hrsh7th/nvim-cmp"] = {
	config = conf.cmp,
	event = "InsertEnter",
	requires = {
		{ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim" },
		{ "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
		{ "hrsh7th/cmp-path", after = "cmp-tmux" },
		{ "hrsh7th/cmp-buffer", after = "cmp-spell" },
		-- {
		--     'tzachar/cmp-tabnine',
		--     run = './install.sh',
		--     after = 'cmp-spell',
		--     config = conf.tabnine
		-- }
	},
}
-- completion["windwp/nvim-autopairs"] = {
-- 	after = "nvim-cmp",
-- 	config = conf.autopairs,
-- }
-- completion["github/copilot.vim"] = { opt = true, cmd = "Copilot" }

return completion
