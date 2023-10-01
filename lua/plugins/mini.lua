return {
    "echasnovski/mini.files",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
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
} 
