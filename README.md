# cyp-vim-syntax

Yet Another Syntax Highlighter for `Check Your Proof` on Vim/Neovim

### Installation
* Install with [vim-plug](https://github.com/junegunn/vim-plug)
```
Plug 'HE7086/cyp-vim-syntax'
```

* Manually installation  
    - copy the syntax file to your vim runtime directory
    - add this to your `vimrc`
    ```
    autocmd BufNewFile,BufRead *.cprf,*.cthy setfiletype cyp
    ```
