return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }

        dashboard.section.header.opts.hl = "AlphaHeader"

        dashboard.section.buttons.val = {
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
            dashboard.button("g", "  Find text", ":Telescope live_grep<CR>"),
            dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
            dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
            dashboard.button("u", "  Update plugins", ":Lazy update<CR>"),
            dashboard.button("q", "⏻  Quit", ":qa<CR>"),
        }

        local function get_plugin_count()
            local lazy_ok, lazy = pcall(require, "lazy")
            if lazy_ok then
                return " " .. #vim.tbl_keys(lazy.plugins()) .. " plugins loaded"
            end
            return "  Plugins loaded"
        end

        local stats_section = {
            type = "text",
            val = get_plugin_count(),
            opts = {
                position = "center",
                hl = "Number",
            },
        }

        dashboard.config.layout = {
            { type = "padding", val = 2 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 1 },
            stats_section,
            { type = "padding", val = 1 },
            dashboard.section.footer,
        }

        dashboard.config.opts.noautocmd = true

        alpha.setup(dashboard.config)
    end,
}
