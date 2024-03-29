let mapleader=" "
let maplocalleader=","

call plug#begin('~/.vim/plugged')
"========================================================================================================================================================================================
" General
"----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Plug 'scrooloose/nerdtree'                                                                  "File Explorer 
Plug 'jiangmiao/auto-pairs'                                                                 "Auto Pairing Brackets
Plug 'tpope/vim-fugitive'                                                                   "Git Integration
Plug 'airblade/vim-gitgutter'                                                               "Git Diff Integration
Plug 'vim-airline/vim-airline'                                                              "Status Bar
Plug 'rafi/awesome-vim-colorschemes'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }                                        "Material Theme
"Plug 'neoclide/coc.nvim', {'branch': 'release'}                                             "Autcomplete
Plug 'lervag/vimtex'                                                                        "Latex Support
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }                                      "Latex Live Preview
Plug 'honza/vim-snippets'
Plug 'vim-pandoc/vim-pandoc'                                                                "Pandoc Support
Plug 'vim-pandoc/vim-pandoc-syntax'                                                         "Pandoc Syntax Highlighting 
Plug 'tpope/vim-commentary'                                                                 "Easy comments
Plug 'nvim-lua/plenary.nvim'                                                                "All utility Lua functions
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}                                 "Treesitter
Plug 'kyazdani42/nvim-web-devicons'                                                         "Icons for Telescope
Plug 'nvim-telescope/telescope.nvim'                                                        "File search
Plug 'mhinz/vim-startify'                                                                   "Better Starts Screen
Plug 'skywind3000/vim-terminal-help'                                                        "Better Terminal
Plug 'christoomey/vim-tmux-navigator'                                                       "Tmux Integration
Plug 'vim-ctrlspace/vim-ctrlspace'                                                          "Workspace Management
"Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}     "Markdown Preview
Plug 'yuttie/comfortable-motion.vim'                                                        "Comfortable Scolling
Plug 'folke/tokyonight.nvim'                                                                "Tokyo Night Theme
Plug 'projekt0n/github-nvim-theme'                                                          "Github Theme
Plug 'ryanoasis/vim-devicons'                                                               "Dev Icons
Plug 'luochen1990/rainbow'                                                                  "Bracket Colours
"Plug 'jceb/vim-orgmode'                                                                     "Org Mode for vim
"----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
" HTML and CSS
"----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }                                      "Prettier for HTML and CSS
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}                             "Live Preview 
" Plug 'Yggdroot/indentLine'                                                                  "Indent Lines for HTML
Plug 'ap/vim-css-color'                                                                     "Color in CSS
Plug 'leafOfTree/vim-svelte-plugin'                                                         "Svelte Syntax Highlighting

"----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
" C++
"----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
"Plug 'dense-analysis/ale'                                                                   "Linting for C++
Plug 'jackguo380/vim-lsp-cxx-highlight'                                                     "Semantic Highliting for C++
"========================================================================================================================================================================================
"Completion
" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim'           " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional

" Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'hrsh7th/cmp-buffer'       " Optional
Plug 'hrsh7th/cmp-path'         " Optional
Plug 'saadparwaiz1/cmp_luasnip' " Optional
Plug 'hrsh7th/cmp-nvim-lua'     " Optional

"  Snippets
Plug 'L3MON4D3/LuaSnip'             " Required
Plug 'rafamadriz/friendly-snippets' " Optional

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}
"
call plug#end()


let g:material_theme_style = 'ocean-community'
let g:tokyonight_style = 'night'
set background=dark

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" For vim CtrlSpace
let g:airline_exclude_preview = 1

" Python-mode
let g:pymode = 1
let g:pymode_python = 'python3'
" let g:pymode_run_bind = '<F5>'
let g:pymode_indent = 1

" Coc config
"let g:coc_global_extensions = ['coc-python']

" use <tab> for trigger completion and navigate to the next complete item
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
"inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<tab>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"let g:coc_snippet_next = '<tab>'
" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
"xmap <leader>x  <Plug>(coc-convert-snippet)

" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocActionAsync('format')

" Show Documentation
"nmap gh :call CocAction('doHover')<CR>

" Organize imports on save
"autocmd BufWritePre *.go, *.cpp, *.c :silent call CocAction('runCommand', 'editor.action.organizeImport')

"let g:coc_default_semantic_highlight_groups = 1

"autocmd BufWritePre *.c,*.h,*.cpp,*.hpp Format

" Vim sneak config

" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <silent> <leader>rf <Plug>(coc-refactor)
"nmap <silent> <leader>rn <Plug>(coc-rename)
"nmap <silent> <leader>o :call CocAction('showOutline')<CR>


" Prettier for vim configuration
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0

augroup VimPrettier
    autocmd!

" Ale Config
"let g:ale_lint_on_enter = 1
"let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 1
"let g:ale_fix_on_save = 1
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

"let g:ale_fixers = {
"            \ 'cpp': ['astyle'],
"            \ 'c': ['astyle']
"            \}

" C++ Semantic Highlisting Config
"let g:lsp_cxx_hl_use_text_props = 1

" Latex Preview Conf
let g:livepreview_engine = 'pdflatex' . ' --shell-escape'

" CtrlSpace
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
    if executable("ag")
        let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
    endif

let g:CtrlSpaceUseTabline = 1

" Markdown Config
let g:vim_markdown_folding_disabled = 1

" Colored Braces
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

lua << EOF
local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "help" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Custom Keybinds
nnoremap '' :NERDTreeToggle<CR>
nnoremap gs :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>f :Files ~<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap gnv :vsplit 
nnoremap gnt :tabedit<CR>
nnoremap gnT <C-w>T
nnoremap <leader>cd :cd %:p:h<CR>:CocRestart<CR><CR>
nnoremap <silent> <leader>tt :!tmux neww<CR><CR>
nnoremap <silent> <leader>tv :!tmux split-window -h<CR><CR>
nnoremap <silent> <leader>th :!tmux split-window -v<CR><CR>
nnoremap <silent> <F5> :!tmux split-window -v "./run.sh && fish"<CR><CR>
nnoremap <silent> <leader>tn :tabedit<CR>:terminal<CR>aranger<CR>
nnoremap gnc :e ~/.config/nvim/init.vim<CR>
nnoremap <silent> ff    <cmd>lua vim.lsp.buf.format()<CR>

" Skipping brackets
inoremap <m-h> <Left>
inoremap <m-j> <Down>
inoremap <m-k> <Up>
inoremap <m-l> <Right>
" Terminal keybindings
tnoremap <leader>jk <C-\><C-n>gk
" Closing Windows
nnoremap gcj <c-w>j:q<CR>
nnoremap gck <c-w>k:q<CR>
nnoremap gcl <c-w>l:q<CR>
nnoremap gch <c-w>h:q<CR>

nnoremap <leader>b :!cd debug && make<CR>

" Switching tabs
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt

inoremap <M-1> <Esc>1gt
inoremap <M-2> <Esc>2gt
inoremap <M-3> <Esc>3gt
inoremap <M-4> <Esc>4gt
inoremap <M-5> <Esc>5gt
inoremap <M-6> <Esc>6gt
inoremap <M-7> <Esc>7gt
inoremap <M-8> <Esc>8gt
inoremap <M-9> <Esc>9gt

inoremap <c-g> <Esc>

nnoremap J gT
nnoremap K gt

"Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fh <cmd>Telescope find_files cwd=~<cr>
nnoremap <leader>fc <cmd>Telescope find_files cwd=~/coding<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

nnoremap <leader>l :PymodeLint<CR>
nnoremap <leader>L :PymodeLintAuto<CR>
"
" Git keybindings
nnoremap <leader>Gs :tab Git status<CR>
nnoremap <leader>Gc :Git commit
nnoremap <leader>Ga :Git add
nnoremap <leader>Gd :tab Git diff<CR>
nnoremap <leader>Gg :tab Git<CR>
nnoremap <leader>Gp :Git push origin master<CR>

" Latex Keybinds
" autocmd FileType tex nnoremap <leader><F5> :!pdflatex --shell-escape %<CR>
" autocmd FileType tex nnoremap <F5> :LLPStartPreview<CR>


" Vim settings
colorscheme material

set relativenumber                          " show line numbers
set termguicolors
set number
set nocompatible
set hidden
set encoding=utf-8
set ruler
set ttyfast                                 " terminal acceleration
set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code
set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}
set enc=utf-8	                            " utf-8 by default
set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files
set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?
set scrolloff=10                            " let 10 lines before/after cursor during scroll
set clipboard=unnamedplus                   " use system clipboard
set shell=fish
set exrc                                    " enable usage of additional .vimrc files from working directory set secure                                  " prohibit .vimrc files to execute shell, create files, etc...
syntax on
set mouse=a

inoremap kj <Esc>
inoremap jk <Esc>
vnoremap  <leader>y  "+y

"Press tab to move out of brackets
"inoremap <expr> <Tab> search('\%#[]>")}]', 'n') ? '<Right>' : '<Tab>'

set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

