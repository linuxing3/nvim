-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local config = {}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = {noremap = true, silent = true}

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set(
        "n",
        "<space>wl",
        function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        bufopts
    )
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

function config.lspconfig()
    local servers = {"bashls", "sumneko_lua", "pyright", "rust_analyzer", "tsserver"}
    for _, server in pairs(servers) do
        require("lspconfig")[server].setup {
            on_attach = on_attach
            -- capabilities = capabilities,
        }
    end
end

function config.lspsaga()
    local saga = require("lspsaga")
    saga.init_lsp_saga(
        {
            error_sign = "",
            warn_sign = "",
            hint_sign = "",
            infor_sign = ""
        }
    )
end

function config.cmp()
    local cmp = require("cmp")
    cmp.setup(
        {
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            mapping = cmp.mapping.preset.insert(
                {
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }
            ),
            sources = cmp.config.sources(
                {
                    {name = "nvim_lsp"},
                    {name = "vsnip"}, -- For vsnip users.
                    {name = "path"},
                    {name = "cmdline"}
                }
            )
        }
    )

    -- Set configuration for specific filetype.
    cmp.setup.filetype(
        "gitcommit",
        {
            sources = cmp.config.sources(
                {
                    {name = "cmp_git"} -- You can specify the `cmp_git` source if you were installed it.
                },
                {
                    {name = "buffer"}
                }
            )
        }
    )

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(
        "/",
        {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                {name = "buffer"}
            }
        }
    )

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(
        ":",
        {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                {
                    {name = "path"}
                },
                {
                    {name = "cmdline"}
                }
            )
        }
    )
end

-- function config.orgmode()
--         require('orgmode').setup{
--             org_agenda_files = {'~/OneDrive/org/*', '~/org/**/*'},
--             org_default_notes_file = '~/OneDrive/org/note.org',
--         }
-- end

function config.neoformat()
    vim.g.neoformat_basic_format_align = 1
    vim.g.neoformat_basic_format_trim = 1
    vim.g.neoformat_basic_format_retab = 0
    vim.g.neoformat_only_msg_on_error = 1
    -- 自动格式化
    vim.cmd([[
    augroup fmt
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
    augroup END
    ]])
    -- vim.keymap.set("n", "<leader>cf", "<cmd>Neoformat<CR>", opts)
end

return config
