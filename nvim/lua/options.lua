-- General --
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 1
vim.opt.foldlevel = 2
vim.opt.termguicolors = true

vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.splitright = true

vim.g.indentLine_color_term = 239
vim.g.indentLine_char_list = {'|', '¦', '┆', '┊'}

vim.g.vim_json_syntax_conceal = 0

vim.api.nvim_create_autocmd({'BufEnter'}, { pattern = '*', command = 'EnableStripWhitespaceOnSave' })

vim.opt.backspace = { 'indent', 'eol', 'start' }

-- Terraform --
vim.g.terraform_fmt_on_save = 1
vim.g.terraform_fold_sections = 0
vim.g.terraform_remap_spacebar = 0
vim.g.terraform_commentstring = "# %s"

-- vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, { pattern = '*', command='TSBufEnable highlight' })

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.tfvars', command = 'setl filetype=terraform' })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.tf', command = 'setl filetype=terraform' })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.hcl', command = 'setl filetype=terraform' })

-- NERD Commeter --
vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1
vim.g.NERDAltDelims_java = 1
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDTrimTrailingWhitespace = 1

vim.g.NERDTreeMinimalUI = 0
vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeWinSize = 30
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeAutoCenter = 1
vim.g.NERDTreeShowLineNumbers = 0
vim.g.NERDTreeShowFiles = 1
vim.g.NERDTreeShowFilesSort = 1
vim.g.NERDTreeShowHidden = 0

vim.g.WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ' '
vim.g.DevIconsDefaultFolderOpenSymbol = ' '

-- Better Whitespace
vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0

vim.api.nvim_create_autocmd({ 'BufEnter' },{ pattern = '*.tf', command = 'EnableStripWhitespaceOnSave' })

-- Slimux --
vim.g.slime_target = "tmux"
vim.g.slime_dont_ask_default = 0
vim.g.slime_python_ipython = 1
vim.g.slime_default_config = "{ 'socket_name': 'default', 'target_pane': '2'}"

-- Git Gutter --
vim.opt.updatetime = 250
vim.g.gitgutter_max_signs = 9999
vim.g.gitgutter_override_sign_column_highlight = 0

-- Windows resizer --
vim.g.winresizer_enabled = 1
vim.g.winresizer_gui_enable = 0

