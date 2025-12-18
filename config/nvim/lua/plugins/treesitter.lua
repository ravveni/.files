return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter'.install { 'html', 'latex', 'yaml' }
    vim.api.nvim_create_autocmd( 'FileType', { pattern = 'md',
    callback = function(args)
        vim.treesitter.start(args.buf, 'markdown')
    end
    })
  end
}

