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
        {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-cmdline"},
        {"hrsh7th/cmp-vsnip"},
        {"hrsh7th/vim-vsnip"}
        -- { "nvim-orgmode/orgmode", config = config.orgmode },
    }
}

ide["sbdchd/neoformat"] = {
    config = config.neoformat
}

return ide
