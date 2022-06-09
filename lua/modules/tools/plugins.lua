local tools = {}
local conf = require("modules.tools.config")

tools["nvim-lua/plenary.nvim"] = {opt = false}

-- fuzzy search stuff
tools["nvim-telescope/telescope.nvim"] = {
    opt = false,
    module = "telescope",
    cmd = "Telescope",
    config = conf.telescope,
    requires = {
        {"nvim-lua/plenary.nvim", opt = false},
        {"nvim-lua/popup.nvim", opt = true}
    }
}
tools["nvim-telescope/telescope-fzf-native.nvim"] = {
    opt = false,
    run = "make",
    after = "telescope.nvim"
}
tools["nvim-telescope/telescope-project.nvim"] = {
    opt = false,
    after = "telescope-fzf-native.nvim"
}
tools["nvim-telescope/telescope-file-browser.nvim"] = {
    opt = false,
    after = "telescope-fzf-native.nvim"
}

-- tools["nvim-telescope/telescope-frecency.nvim"] = {
-- 	opt = true,
-- 	after = "telescope-project.nvim",
-- 	requires = { { "tami5/sqlite.lua", opt = true } },
-- }
-- tools["jvgrootveld/telescope-zoxide"] = { opt = true, after = "telescope-frecency.nvim" }

-- snip run
-- tools["michaelb/sniprun"] = {
--     opt = true,
--     run = "bash ./install.sh",
--     cmd = {"SnipRun", "'<,'>SnipRun"}
-- }
tools["folke/which-key.nvim"] = {
    keys = ",",
    config = conf.which_key
}
tools["folke/trouble.nvim"] = {
    cmd = {"Trouble", "TroubleToggle", "TroubleRefresh"},
    config = conf.trouble
}
tools["dstein64/vim-startuptime"] = {opt = true, cmd = "StartupTime"}
tools["gelguy/wilder.nvim"] = {
    event = "CmdlineEnter",
    config = conf.wilder,
    requires = {{"romgrk/fzy-lua-native", after = "wilder.nvim"}}
}
tools["nathom/filetype.nvim"] = {
    opt = false,
    config = conf.filetype
}

tools["nvim-pack/nvim-spectre"] = {
    config = conf.spectre,
    requires = {
        "nvim-lua/plenary.nvim", -- Lua 开发模块
        "BurntSushi/ripgrep" -- 文字查找
    }
}

return tools
