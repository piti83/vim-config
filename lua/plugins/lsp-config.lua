return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        "neovim/nvim-lspconfig",
    },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },

        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local servers = {
                "lua_ls",
                "asm_lsp",
                "jsonls",
                "bashls",
                "jdtls",
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })
            end

            vim.lsp.config("pyright", {
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "off",
                            diagnosticSeverityOverrides = {
                                reportGeneralTypeIssues = "none",
                                reportOptionalMemberAccess = "none",
                            },
                        },
                    },
                },
            })

            local clangd_cmd = {
                "clangd",
                "--background-index",
            }

            local cxx = vim.env.CXX

            if cxx and cxx ~= "" then
                local compiler = vim.split(cxx, "%s+")[1]
                local driver = vim.fn.exepath(compiler)

                if driver ~= "" then
                    table.insert(clangd_cmd, "--query-driver=" .. driver)
                end
            end

            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = clangd_cmd,
            })

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "asm_lsp",
                    "jsonls",
                    "pyright",
                    "bashls",
                    "jdtls",
                },
            })
        end,
    },
}
