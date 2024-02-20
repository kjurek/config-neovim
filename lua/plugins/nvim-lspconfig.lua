return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip"
    },
    config = function()
        -- Add additional capabilities supported by nvim-cmp
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require('lspconfig')

        -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
        -- lua
        lspconfig.lua_ls.setup { capabilities = capabilities }

        -- python
        lspconfig.pyright.setup { capabilities = capabilities }

        -- cpp
        lspconfig.clangd.setup {
          on_attach = function(client, bufnr)
            client.server_capabilities.signatureHelpProvider = false
            on_attach(client, bufnr)
          end,
          capabilities = capabilities
        }

        -- luasnip setup
        local luasnip = require 'luasnip'

        -- nvim-cmp setup
        local cmp = require 'cmp'
        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
                -- C-b (back) C-f (forward) for snippet placeholder navigation.
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            },
        }

        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, {desc="Open diagnostic on current line"})
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc="Go to previous diagnostic"})
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc="Go to next diagnostic"})
        vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, {desc="Open all diagnostics"})

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts, {desc="Go to declaration"})
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts, {desc="Go to definition"})
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts, {desc="Show documentation"})
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts, {desc="Go to implementation"})
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts, {desc="Show signature"})
                vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts, {desc="Show signature"})
                vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts, {desc="Add workspace folder"})
                vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts, {desc="Remove workspace folder"})
                vim.keymap.set('n', '<Leader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts, {desc="List workspace folders"})
                vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts, {desc="Show type definition"})
                vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts, {desc="Rename"})
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts, {desc="Code action"})
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts, {desc="Show references"})
                vim.keymap.set('n', '<space>f', function()
                  vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })
    end
}
