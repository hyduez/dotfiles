return {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        file_ignore_patterns = {
            'node_modules',
            'dist',
            '.git',
            'build',
            'target',
            'package-lock.json',
            'bun.lock',
            'pnpm-lock.yaml',
            'yarn.lock',
        },
    },
}
