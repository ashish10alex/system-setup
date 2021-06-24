stem-setup

* `.vimrc` - Guide to setup custom vim editor with key bindings and plugins to make it productive and pretier :)
* `Ubuntu-aws.md` - Deploying flask based web application on an ubuntu machine (tested on an aws instance)



Screenshot of resulting theme from using `.vimrc` file in the repository. Watch my [youtube video](https://www.youtube.com/watch?v=Cs4MBcEUrMk) on how to get started with setting up this theme
<b>Note</b> - Current version has arrow keys disabled in the normal mode for me to get used to `J, K, H, L` navigation.

<img width="549" alt="Screenshot 2021-06-20 at 12 22 34" src="https://user-images.githubusercontent.com/34306898/122672203-3b149f80-d1c2-11eb-8570-fc41a319fa39.png">


## Vimrc

* ### [Coc plugin](https://github.com/neoclide/coc.nvim)

Coc plugin allows easy navigation to function definition along with autocomplete feature for which it is primarily known for. However I have disabled python autocomplete and have only retained autocomplete for other files like `*.js`

I have also disabled python linting in the Coc-config file located at `/Users/<username>/.vim/coc-settings.json`
Coc-config file can optionally be opned from anywhere by `:CocConfig`

Following is my Coc-config file. 
```
{
"coc.preferences.useQuickfixForLocations": true,
"python.linting.enabled": false,
"python.linting.pylintEnabled": true,
"python.jediEnabled": true,
"python.linting.lintOnSave": true,
"python.linting.flake8Enabled": true
}
```
You would very likely need to do - `pip3 install jedi` to enable navigation between python functions. In tests so far `jedi` works fine with `python 3.7` but some features such as `coc-references` failed with `python 3.9`. Documentation on how to do this navigation is covered in `.vimrc` file.

Additionally you can set your python interpreter by - `:CocCommand python.setInterpreter`.

#### Installing coc plugin on ubunutu systems without `sudo` access

Coc plugin requires you to have node and npm installed. However if you are unable to install these the standard ways (`brew`, `apt` etc..) you can manually donwload [node and npm binaries](https://nodejs.org/dist/) and add path of `node` and `npm` to your `.vimrc` and `coc-settings.json` files respectively. <b>Note</b> - Latest version of `node` binary `*.gz` file also ships with `nmp` and `yarn` binaries; which are used to install language servers e.g. `:CocInstall coc-python, coc-json, coc-tssever`. <b>Note</b> If `:CocInstall` command fails make sure that you have `node` and `npm` in your system path. To see how to add binaries to system path [click here.](####Add-binaries-to-path)

Commands to download node binaries
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

#### Add-binaries-to-path
Installing other packages ([fzf](https://github.com/junegunn/fzf) (file navigation) and [bat](https://github.com/sharkdp/bat) (syntax highlighting)) with binaries in  Ubuntu based linux distros in case you can not `sudo`.


```
mkdir ~/my-bin
ln -s ~/<path-to-executable>/<executable> ~/my-bin
#Add this line to .bashrc
PATH=$PATH:~/my-bin
```
