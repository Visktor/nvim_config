return {{
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    vscode = true,
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            surrounds = {
                ["A"] = {
                    add = {"<", "/>"}
                },
                ["q"] = {
                    add = {"'", "'"}
                },
                ["Q"] = {
                    add = {'"', '"'}
                },
                ["w"] = {
                    add = {"`", "`"}
                },
                ["c"] = {
                    add = {"```", "```"}
                },
                ["s"] = {
                    add = {"~", "~"}
                },
                ["h"] = {
                    add = {"==", "=="}
                },
                ["l"] = {
                    add = {"[[", "]]"}
                },
                ["B"] = {
                    add = {"{", "}"}
                }
            },
            keymaps = {
                insert = "<C-g>s",
                insert_line = "<C-g>S",
                normal = "S",
                normal_cur = "SS",
                normal_cur_line = "SSG",
                visual = "S",
                visual_line = "SG",
                delete = "ds",
                change = "cs",
                change_line = "cS"
            }
        })
    end
}, {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    vscode = true,
    opts = {
        n_lines = 2000,
        custom_textobjects = {
            t = false
        },
        search_method = "cover_or_nearest"
    }
}, {
    "dmmulroy/tsc.nvim",
    config = function()
        require("tsc").setup({
            run_as_monorepo = true
        })
    end,
    lazy = false
},
{
    "chrisgrieser/nvim-spider",
    lazy = true,
    vscode = true,
    opts = {
        subwordMovement = false
    },
    keys = {{
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = {"n", "o", "x"}
    }, {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = {"n", "o", "x"}
    }, {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = {"n", "o", "x"}
    }}
}, {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",
    vscode = true,
    opts = {
        useDefaults = true
    }
}, {
    "Goose97/timber.nvim",
    vscode = true,
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("timber").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
}}
