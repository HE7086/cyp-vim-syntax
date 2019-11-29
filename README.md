# cyp-vim-syntax

Yet Another Syntax Highlighter for `Check Your Proof` on Vim/Neovim

### Installation
* Install with [vim-plug](https://github.com/junegunn/vim-plug)
```
Plug 'HE7086/cyp-vim-syntax'
```

* Manually install 
    - copy the syntax file to your vim runtime directory  
      which is likely in `~/.vim` for vim or `~/.config/nvim` for neovim
    - add this to your `vimrc`
    ```
    autocmd BufNewFile,BufRead *.cprf,*.cthy setfiletype cyp
    ```
### Indentation
* Since [f17676e](f17676e81d24a130fb2d84445b1a82aa9ff45bc4) is indentation supported (beta version)
* You can use `==` in normal mode to indent a line and `gg=G` to indent the whole file
* Due to limit of vim's built-in indentation function, auto formating is not possible without third-party plugins

### Customization
In order to change the behaviour of the syntax, you need to put following line in your `vimrc` accordingly
* Don't color the braces in a `by` reference
```
let g:cyp_syntax_referbrace=1
```
* Use an alternative built-in colorscheme, as the default one is mainly optimized for the theme [vim-one](https://github.com/rakr/vim-one) and may not behave well in other themes
```
let g:cyp_colorscheme=1
```

### Reference
* [cyp](https://github.com/noschinl/cyp)

### Known BUGs
* sometimes you need to indent twice to get a correct indentation, cause it is context related
