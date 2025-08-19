---
markmap:
  color:
    - blue
  initialExpandLevel: 4
  # other options
---

# [go back](../index.html)
# sample
## basic
```bash
filetype plugin indent on    " required
if has("autocmd")
  au BufReadPost * if line("'\"") >0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
set t_te=
"set modeline
"set modelines=5
au BufRead,BufNewFile *.ino set filetype=cpp
" set tags=./tags;/;
" set tags=/home/ralph/work/test/sdk/comtrend/pbl-6201/ctags_n_cscope/userspace/tags 
set ts=4 sw=4 noet
set encoding=utf-8
" cs add /home/ralph/work/test/sdk/comtrend/pbl-6201/ctags_n_cscope/userspace/cscope.out
cs add cscope.out
if filereadable("/tmp/tags.vim")
    source /tmp/tags.vim
endif
if filereadable("/tmp/cscope.out")
    cs add /tmp/cscope.out
endif
```
