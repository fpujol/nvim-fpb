require('null-ls').setup({
    sources = {
        require('null-ls').builtins.formatting.stylua,
        require('null-ls').builtins.diagnostics.eslint,
        require('null-ls').builtins.completion.spell,
    },
should_attach = function(bufnr)
        return not vim.api.nvim_buf_get_name(bufnr):match("^git://")
    end,
})
