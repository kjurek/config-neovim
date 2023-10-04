return {
    {
        "echasnovski/mini.files",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        keys = {
            {
                "<leader>E",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
                end,
                desc = "Explorer (Current File)",
            },
            {
                "<leader>e",
                function()
                    require("mini.files").open(vim.loop.cwd(), true)
                end,
                desc = "Explorer (Current Directory)",
            },
        },
        config = function()
            require("mini.files").setup()
        end
    },
    {
        "echasnovski/mini.tabline",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("mini.tabline").setup()
        end
    },
    {
        "echasnovski/mini.statusline",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("mini.statusline").setup()
        end
    },
    {
        "echasnovski/mini.cursorword",
        config = function()
            require("mini.cursorword").setup()
        end
    }
} 
