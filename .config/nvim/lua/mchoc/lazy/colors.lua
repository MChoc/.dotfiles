return {
    --[[
    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-frappe")
        end,
    }
    --]]
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = { style = "moon" },
        config = function()
            vim.cmd.colorscheme("tokyonight")
            vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "white" })
            vim.api.nvim_set_hl(0, "LineNr", { fg = "white" })
        end,
    }
}
