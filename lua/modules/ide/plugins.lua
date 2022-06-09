---@diagnostic disable: undefined-global
local ide = {}

local config = require("modules.ide.config")

ide["neovim/nvim-lspconfig"] = {
    opt = false,
    config = config.lspconfig
}

ide["tami5/lspsaga.nvim"] = {
    after = "nvim-lspconfig",
    config = config.lspsaga
}

ide["stevearc/aerial.nvim"] = {
    after = "nvim-lspconfig"
}
ide["kosayoda/nvim-lightbulb"] = {
    after = "nvim-lspconfig"
}

ide["ray-x/lsp_signature.nvim"] = {opt = true, after = "nvim-lspconfig"}

ide["hrsh7th/nvim-cmp"] = {
    config = config.cmp,
    event = "InsertEnter",
    requires = {
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-buffer", after = "nvim-cmp" },
        {"hrsh7th/cmp-path", after = "nvim-cmp"},
        {"hrsh7th/cmp-cmdline", after = "nvim-cmp"},
        {"hrsh7th/cmp-vsnip", after = "nvim-cmp"},
        {"hrsh7th/vim-vsnip", after = "nvim-cmp" }
        -- { "nvim-orgmode/orgmode", config = config.orgmode },
    }
}

ide["sbdchd/neoformat"] = {
    config = config.neoformat
}

ide["akinsho/toggleterm.nvim"] = {
    config = config.toggleterm
}

ide["numToStr/FTerm.nvim"] = {
    config = config.fterm
}

ide["tpope/vim-fugitive"] = {
    cmd = {
        "G",
        "Git",
        "Gdiffsplit",
        "Gread",
        "Gwrite",
        "Ggrep",
        "GMove",
        "GDelete",
        "GBrowse",
        "GRemove",
        "GRename",
        "Glgrep",
        "Gedit"
    },
    ft = {"fugitive"}
}

-- ide["tpope/vim-sourround"] = {
--     keys = {"c", "d", "y"}
-- }

ide["kevinhwang91/rnvimr"] = {
    cmd = "RnvimrToggle",
    config = function()
        vim.g.rnvimr_draw_border = 1
        vim.g.rnvimr_pick_enable = 1
        vim.g.rnvimr_bw_enable = 1
    end
}


return ide
