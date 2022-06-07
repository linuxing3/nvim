local editor = {}
local conf = require("modules.editor.config")

editor["junegunn/vim-easy-align"] = { opt = true, cmd = "EasyAlign" }
-- editor["RRethy/vim-illuminate"] = {
-- 	event = "BufRead",
-- 	config = function()
-- 		vim.g.Illuminate_highlightUnderCursor = 0
-- 		vim.g.Illuminate_ftblacklist = {
-- 			"help",
-- 			"dashboard",
-- 			"alpha",
-- 			"packer",
-- 			"norg",
-- 			"DoomInfo",
-- 			"NvimTree",
-- 			"Outline",
-- 			"toggleterm",
-- 		}
-- 	end,
-- }
editor["terrortylor/nvim-comment"] = {
	opt = false,
	config = function()
		require("nvim_comment").setup({
			hook = function()
				require("ts_context_commentstring.internal").update_commentstring()
			end,
		})
	end,
}
editor["nvim-treesitter/nvim-treesitter"] = {
	opt = true,
	run = ":TSUpdate",
	event = "BufRead",
	config = conf.nvim_treesitter,
}
editor["nvim-treesitter/nvim-treesitter-textobjects"] = {
	opt = true,
	after = "nvim-treesitter",
}
editor["p00f/nvim-ts-rainbow"] = {
	opt = true,
	after = "nvim-treesitter",
	event = "BufRead",
}
editor["JoosepAlviste/nvim-ts-context-commentstring"] = {
	opt = true,
	after = "nvim-treesitter",
}
editor["mfussenegger/nvim-ts-hint-textobject"] = {
	opt = true,
	after = "nvim-treesitter",
}
editor["windwp/nvim-ts-autotag"] = {
	opt = true,
	after = "nvim-treesitter",
	config = conf.autotag,
}
editor["andymass/vim-matchup"] = {
	opt = true,
	after = "nvim-treesitter",
	config = conf.matchup,
}

return editor
