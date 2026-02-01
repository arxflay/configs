call plug#begin()
	Plug 'vim-airline/vim-airline'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'Mofiqul/vscode.nvim'
    Plug 'romgrk/barbar.nvim'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'Pocco81/auto-save.nvim'
    Plug 'tikhomirov/vim-glsl'
    Plug 'mfussenegger/nvim-dap'
call plug#end()
set encoding=UTF-8
set number
set updatetime=300
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
set termguicolors
colorscheme vscode
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set clipboard=unnamedplus
autocmd VimEnter * NERDTree | wincmd p
set completeopt-=preview
nnoremap <C-n> :NERDTree<CR>
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>

function DoNerdtreeRefresh()
    let winname = &filetype
    call NERDTreeFocus() 
    call g:NERDTree.ForCurrentTab().getRoot().refresh() 
    call g:NERDTree.ForCurrentTab().render()
    if (winname != 'nerdtree')
        wincmd p
    endif
endfunction

autocmd CursorHold,CursorHoldI * call DoNerdtreeRefresh() 
lua << EOF
    require('nvim-treesitter.configs').setup { 
        highlight = { enable = true, additional_vim_regex_highlighting = false, } 
    }
EOF

lua << EOF
    require("auto-save").setup {
         trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
	     debounce_delay = 135
    }
EOF

lua << EOF
    local dap = require("dap")
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "-i", "dap" }
    }

    dap.configurations.c = {
        {
            name = "Launch",
            type = "gdb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = "${workspaceFolder}",
            stopAtBeginningOfMainSubprogram = false,
        }
    }
EOF
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  endif
endfunction
nnoremap <silent> , :call ShowDocumentation()<CR>

set statusline^=%{coc#status()}
