`vim-nestedtext` --- Syntax highlighting for NestedText files
==============================================================
`vim-nestedtext` is a vim plugin that provides syntax highlighting for the 
[NestedText](https://nestedtext.org) file format.

Installation
------------
`vim-nestedtext` can be installed using any of the plugin management systems 
out there:

### [pathogen](https://github.com/tpope/vim-pathogen)

Clone this repository into your `.vim/bundle` directory:

    cd ~/.vim/bundle
    git clone git://github.com/kalekundert/vim-nestedtext.git

### [vim-plug](https://github.com/junegunn/vim-plug)

Put the following line(s) in the `call plug#begin()` section of your `.vimrc` 
file:

    Plug 'kalekundert/vim-nestedtext'
    Plug 'Konfekt/FastFold'

### [Vim8 native plugins](https://vimhelp.org/repeat.txt.html#packages)

Clone the repository into `.vim/pack/*/start`:

    mkdir -p ~/.vim/pack/git-plugins/start
    cd ~/.vim/pack/git-plugins/start
    git clone git://github.com/kalekundert/vim-nestedtext.git

Note that you can name the directories in `.vim/pack/` whatever you like, so 
the `git-plugins` name in the snippet above is just an example.

Features
--------
- Syntax highlighting
- Show trailing whitespace
- Indent-based folding

Feedback
--------
Please feel free to create an 
[issue](https://github.com/kalekundert/vim-nestedtext/issues) or a [pull 
request](https://github.com/kalekundert/vim-nestedtext/pulls) if you have any 
trouble with this plugin.
