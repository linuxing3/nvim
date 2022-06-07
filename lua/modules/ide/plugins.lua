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

ide["tpope/vim-sourround"] = {
    keys = {"c", "d", "y"}
}

ide["kevinhwang91/rnvimr"] = {
    cmd = "RnvimrToggle",
    config = function()
        vim.g.rnvimr_draw_border = 1
        vim.g.rnvimr_pick_enable = 1
        vim.g.rnvimr_bw_enable = 1
    end
}

ide["camspiers/snap"] = {
    rocks = "fzy",
    config = function()
        local snap = require("snap")
        local layout = snap.get("layout").bottom
        local file = snap.config.file:with {consumer = "fzy", layout = layout}
        local vimgrep = snap.config.vimgrep:with {layout = layout}
        snap.register.command("find_files", file {producer = "ripgrep.file"})
        snap.register.command("buffers", file {producer = "vim.buffer"})
        snap.register.command("oldfiles", file {producer = "vim.oldfile"})
        snap.register.command("live_grep", vimgrep {})
    end
}

return ide
