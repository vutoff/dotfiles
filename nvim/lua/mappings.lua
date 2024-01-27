local function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { remap = false })
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

-- Mappings --
nmap('<F2>', ':ToggleWhitespace<CR>')
nmap('<F3>', ':NvimTreeToggle<CR>')
nmap('F7', ':setlocal spell spelllang=en_us<CR>')

nmap('<C-J>','<C-W><C-J>')
nmap('<C-K>', '<C-W><C-K>')
nmap('<C-L>', '<C-W><C-L>')
nmap('<C-H>', '<C-W><C-H>')
vmap('<C-y>', '"*y<CR>')

nmap('<Leader>r', '<Plug>SlimeLineSend')
vmap('<Leader>e', '<Plug>SlimeRegionSend')

-- FZF --
nmap('<C-p>', ":FzfLua files<CR>")
nmap('<C-f>', ':FzfLua grep_project<CR>')
nmap('<C-c>', ':BCommits<CR>')
nmap('<C-w>', ':Windows<CR>')

-- Move lines --
nmap('<S-Up>', ':m-2<CR>')
nmap('<S-Down>', ':m+<CR>')
imap('<S-Up>', '<Esc>:m-2<CR>')
imap('<S-Down>', '<Esc>:m+<CR>')

-- Reload config --
nmap('<Leader>rc', ':luafile ~/.config/nvim/init.lua<CR>')

-- Window Resizer --
nmap('<C-t>', ':WinResizerStartResize<CR>')
