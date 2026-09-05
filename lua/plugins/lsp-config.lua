return {
    { "williamboman/mason.nvim", config = true },
    { "neovim/nvim-lspconfig" },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()


            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "asm_lsp",
                    "jsonls",
                    "pyright",
                    "bashls",
                    "jdtls"
                },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                        })
                    end,
                    ["pyright"] = function()
                        require("lspconfig").pyright.setup({
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
                    end,
                    ["clangd"] = function()
                        require("lspconfig").clangd.setup({
                            capabilities = capabilities,
                            cmd = {
                                "clangd",
                                "--background-index",
                                "--query-driver=/**/*gcc,/**/*g++",
                            },
                        })
                    end,
                },
            })
        end,
    },
}
