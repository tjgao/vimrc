set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'xoria256.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/genutils'
Plugin 'FuzzyFinder'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'jwhitley/vim-matchit'
Plugin 'altdev/Color-Sampler-Pack'
Plugin 'msanders/snipmate.vim'
Plugin 'neocomplcache'
Plugin 'Tabular'
Plugin 'mru.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/Markdown'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'tpope/vim-commentary'

" let g:EasyMotion_leader_key='\'

" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_user_command = 'find %s -type f'
" "let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" "let g:ctrlp_custom_ignore = {
" "            \'dir':'\v[\/]\.(git|hg|svn)$',
" "            \'file':'\v\.(exe|so|dll)$',
" "}
set wildignore+=*/tmp/*,*.so,*.swp,*.zip


filetype on
filetype plugin on
filetype indent on

syntax on
set hidden
set incsearch
set ignorecase
set smartcase
set hlsearch
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set softtabstop=4
"set ts=4
set nu
set showmatch
set laststatus=2
"set spell
set cpoptions+=$
set t_Co=256
set dictionary+=/usr/share/dict/words
"set thesaurus+=/Users/tiejungao/Documents/thesaurus/mthesaur.txt
" hide toolbar
set guioptions-=T
" hide right scrollbar
set guioptions-=r
" This will prevent completion from filling the first iterm in completion list
set completeopt=menuone,longest

set ignorecase smartcase
set wrap
" Make tab-completion more like bash
set wildmode=longest,list,full
set wildmenu

set foldmethod=syntax
set nofen

colorscheme xoria256
if has('gui_running')
	if has("gui_gtk2") || has("gui_gtk3")
		set guifont=Envy\ Code\ R\ 11
	else
		set guifont=Envy_Code_R:h14
	endif
endif


" For command mode 
cmap <c-a> <home>
cmap <c-e> <end>
" In case some time you need sudo to overwirte readonly files
cmap w!! w !sudo tee > /dev/null %
cnoremap <c-b> <left>
cnoremap <c-f> <right>
cnoremap <c-h> <s-left>
cnoremap <c-l> <s-right>


" noremap <c-a> <Esc>:MRU<CR>
" Toggle NERDTree
noremap <c-l> <Esc>:NERDTreeToggle<CR>
" FuzzyFind for ctag files
noremap <F2> <Esc>:FufTaggedFile<CR>
" FuzzyFind for files in current directory
noremap <F3> <Esc>:FufFile<CR>
" FuzzyFind for buffers
noremap <F4> <Esc>:FufBuffer<CR>
" Create a new tab
noremap <S-F1> <Esc>:tabnew<CR>
" Switch to next tab
noremap <S-Tab> <Esc>:tabNext<CR>
" Switch back to previous tab
noremap <C-Tab> <Esc>:tabprevious<CR>
" Close other windows and only current windows is left
noremap <C-Esc> <Esc>:only<CR>
" Close current window
noremap <C-Backspace> <Esc>:close<CR>

inoremap <S-Space> <c-r>=<C-X><C-U><CR>


"fun! ReadThesaurus()
"   " Assign current word under cursor to a script variable
"   let s:thes_word = expand('<cword>')
"   " Open a new window, keep the alternate so this doesn't clobber it. 
"   keepalt split thes_ . tempname()
"   " Show cursor word in status line
"   exe "setlocal statusline=" . s:thes_word
"   " Set buffer options for scratch buffer
"   setlocal noswapfile nobuflisted nowrap nospell 
"     \buftype=nofile bufhidden=hide 
"   " Delete existing content
"   1,$d
"   " Run the thesaurus script
"   exe ":0r !/Users/tiejungao/bin/thesaurus " . s:thes_word 
"   " Goto first line
"   1
"   " Set file type to 'thesaurus'
"   set filetype=thesaurus
"   " Map q to quit without confirm
"   nmap <buffer> q :q<CR>
"endfun
"" Map the K key to the ReadThesaurus function
"noremap <buffer> K :call ReadThesaurus()<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE: 
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE: 
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
"    set cscopetag
    set cst
    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    if $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    " quickfix
    set cscopequickfix=s+,d+,c+,t+,e+
    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-SPACE>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-SPACE>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-SPACE>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-SPACE>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-SPACE>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-SPACE>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-SPACE>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-SPACE>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    nmap <C-SPACE><C-s> :cs find s 
    nmap <C-SPACE><C-g> :cs find g 
    nmap <C-SPACE><C-c> :cs find c 
    nmap <C-SPACE><C-t> :cs find t 
    nmap <C-SPACE><C-e> :cs find e 
    nmap <C-SPACE><C-f> :cs find f 
"    nmap <C-SPACE><C-i> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-SPACE><C-d> :cs find d 
    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-SPACE><C-SPACE>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-SPACE><C-SPACE>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-SPACE><C-SPACE>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-SPACE><C-SPACE>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-SPACE><C-SPACE>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-SPACE><C-SPACE>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-SPACE><C-SPACE>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-SPACE><C-SPACE>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100
endif

" monitor cd actions
function! ChdirHook(dir)
    exec "chdir " . a:dir
"    do User chdir
    if filereadable(a:dir . "/cscope.out")
        exec "cs add " . a:dir . "/cscope.out"
    endif
endfunction

if !exists('g:cd_hooked')
    let g:cd_hooked=1
"    augroup User chdir
"       au!
"    augroup end
    com -complete=dir -nargs=1 Cd call ChdirHook(<q-args>)
endif

" Make j and k move not on linewise basis
nmap j gj
nmap k gk

" Temporarily clear hlsearch results
nmap \s :noh<CR>


let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
nmap <leader>p :CtrlP<CR>

nmap <leader>bb :CtrlPBuffer<CR>
nmap <leader>bu :CtrlPMRU<CR>
nmap <leader>ba :CtrlPMixed<CR>

