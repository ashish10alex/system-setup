## Table of contents
* [Vim development environment](#header-1)
    - [Tmux](https://github.com/ashish10alex/system-setup/blob/main/tmux.md)

* [Guide to deploy Flask web app on AWS instance](https://github.com/ashish10alex/system-setup/blob/main/Ubuntu-aws.md)

<h3 id="header-1">Vim development environment</h3> 

https://user-images.githubusercontent.com/34306898/123353903-731d3900-d55a-11eb-99a9-126fbbcb6716.mov

Run the following commands to setup your development environment similar to the
one shown in the video
```
git clone https://github.com/ashish10alex/system-setup.git
cd system-setup
cp .vimrc ~/
#install plugin manager 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
source ~/.vimrc
```
Now open `~/.vimrc` and run `:PlugInstall`. Watch my [youtube video](https://www.youtube.com/watch?v=Cs4MBcEUrMk) on how to get started with setting up this theme

[Vim profiler](https://github.com/bchretien/vim-profiler) -  `python3 vim-profiler.py` to identify the top 10 Plugins that might be slowing down your vim
startup time. Example output of my `.vimrc` (all times are in milli seconds) 

```
Running vim to generate startup logs... done.
Loading and processing logs... done.
Plugin directory: /Users/ashishalex/.vim/plugged
====================================
Top 10 plugins slowing vim's startup
====================================
1  43.032   vim-polyglot
2  19.896   vim-one
3  11.140   nerdtree
4   7.465   vim-airline
5   5.714   coc.nvim
6   2.764   vim-gitgutter
7   2.264   nerdtree-git-plugin
8   1.934   vimtex
9   1.782   vim-fugitive
10    1.009   fzf
====================================
```

<b>Note</b> - Current version has arrow keys disabled in the `normal mode `for me to get used to `j, k, h, l` navigation. 

I personally use [vim-one](https://github.com/rakr/vim-one) color scheme on my MAC OS with some [changes](https://github.com/ashish10alex/system-setup/blob/main/one.vim) to the default color scheme file. I use the default [one-half](https://github.com/sonph/onehalf) color scheme for Ubuntu. To make changes in the colorscheme use [this reference](https://jonasjacek.github.io/colors/) which has the list of 256 Xterm colors and make changes to colorscheme files which should be located in the following directories after you have ran the initial installation commands.



[vim-one](https://github.com/rakr/vim-one) color scheme file (Mac OS)
```
vi ~/.vim/plugged/vim-one/colors/one.vim

#to get exactly the color scheme that Iam using -
git clone https://github.com/ashish10alex/system-setup
cd system-setup
cp one.vim ~/.vim/plugged/vim-one/colors/one.vim
```
[one-half](https://github.com/sonph/onehalf) color scheme file (Ubuntu)
```
vi ~/.vim/plugged/onehalf/vim/colors/onehalfdark.vim
```



[Coc plugin](https://github.com/neoclide/coc.nvim) allows easy navigation to function definition along with autocomplete feature for which it is primarily known for. However I have disabled python autocomplete and have only retained autocomplete for other files extensions like `*.js`.

I have also disabled python linting in the Coc-config file located at `/Users/<username>/.vim/coc-settings.json`
Coc-config file can optionally be opened from anywhere by `:CocConfig`

Following is my Coc-config file - 
```
{
  /*"npm.binPath": "/jmain01/home/JAD007/txk02/aaa18-txk02/node-from-source/bin/npm",*/

  "coc.preferences.useQuickfixForLocations": true, 
  /* "coc.preferences.formatOnSaveFiletypes": ["python"], */
  "python.linting.enabled": false,
  "python.linting.pylintEnabled": true,
  "python.jediEnabled": true,
  "python.linting.lintOnSave": true,
  "python.linting.flake8Enabled": true,

  "snippets.userSnippetsDirectory": "~/.vim/snips"
}
```
You would very likely need to do - `pip3 install jedi` to enable navigation between python functions.
Please install a suitable language server (e.g. [coc-python,jedi,coc-pyright](https://github.com/neoclide/coc-python) to enable the navigation function)
In tests so far `jedi` works fine with `python 3.7` but some features such as `coc-references` failed with `python 3.9`. Documentation on how to do this navigation is covered in `.vimrc` file.

Additionally you can set your python interpreter by - `:CocCommand python.setInterpreter`. 
* <b> Installing coc plugin on ubuntu systems without `sudo` access </b>

Coc plugin requires you to have node and npm installed. However if you are unable to install these the standard ways (`brew`, `apt` etc..) you can manually download [node and npm binaries](https://nodejs.org/dist/) and add path of `node` and `npm` to your `.vimrc` and `coc-settings.json` files respectively. <b>Note</b> - Latest version of `node` binary `*.gz` file also ships with `nmp` and `yarn` binaries which are used to install language servers e.g. `:CocInstall coc-python, coc-json, coc-tssever`. <b>Note</b> If `:CocInstall` command fails make sure that you have `node` and `npm` in your system path. To see how to add binaries to system path follow the documentation in the sub-section [Add binaries to path](#Add-binaries-to-path).

Commands to download node binaries -  
```
cd ~
mkdir node-from-source
cd node-from-source
wget -c https://nodejs.org/dist/v12.18.0/node-v12.18.0-linux-x64.tar.gz
tar xzf node-v12.18.0-linux-x64.tar.gz
rm -rf node-v12.18.0-linux-x64.tar.gz
mv node-v12.18.0-linux-x64/* .
rm -rf node-v12.18.0-linux-x64

#node binary path
~/node-from-source/bin/node

#npm binary path
~/node-from-source/bin/npm
```
If you run `~/node-from-source/bin/node --version` and get `v12.18.0` as response, you are all set for the next steps

Now add following line to your ~/.vimrc file
`let g:coc_node_path = '$HOME/node-from-source/bin/node'`

And path of nmp to your `coc-settings.json`
`"npm.binPath": "$HOME/node-from-source/bin/npm",`

Here `$HOME` should automagically add full path to your home directory. If it gives an error please add full path manually. 

<h4 id="Add-binaries-to-path">Add binaries to path</h4> 

Installing other packages such as [fzf](https://github.com/junegunn/fzf) (file navigation) and [bat](https://github.com/sharkdp/bat) (syntax highlighting) with binaries in  Ubuntu based Linux distributions in case you can not `sudo`.

```
mkdir ~/my-bin
ln -s ~/<path-to-executable>/<executable> ~/my-bin
#Add this line to .bashrc
PATH=$PATH:~/my-bin
```
