local lsp_installer = require('nvim-lsp-installer')

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }

    buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) -- go to definition
    buf_set_keymap("n", "gu", ":lua vim.lsp.buf.implementation()<CR>", opts) -- list implementations
    buf_set_keymap("n", "gi", ":lua vim.lsp.buf.hover()<CR>", opts) -- hover info preview
    buf_set_keymap("n", "gI", ":lua vim.lsp.buf.hover()<CR> | :lua vim.lsp.buf.hover()<CR>", opts) -- hover info
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_installer.on_server_ready(function(server)
    local default_opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    server:setup(default_opts)
end)

