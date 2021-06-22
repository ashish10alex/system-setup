# system-setup

* `.vimrc` - Guide to setup custom vim editor with key bindings and plugins to make it productive and pretier :)
* `Ubuntu-aws.md` - Deploying flask based web application on an ubuntu machine (tested on an aws instance)



Screenshot of resulting theme from using `.vimrc` file in the repository. Watch my [youtube video](https://www.youtube.com/watch?v=Cs4MBcEUrMk) on how to get started with setting up this theme
Note - Current version has arrow keys disabled in the normal mode for me to get used to `J, K, H, L` navigation.

<img width="549" alt="Screenshot 2021-06-20 at 12 22 34" src="https://user-images.githubusercontent.com/34306898/122672203-3b149f80-d1c2-11eb-8570-fc41a319fa39.png">


## Vimrc

* [Coc plugin](https://github.com/neoclide/coc.nvim) allows easy navigation: find and jump to function definition.
However I have disabled python autocomplete and have only retained autocomplete for other files like *.js

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
~
```
You would very likely need to do - `pip3 install jedi` to enable navigation between python functions.
Documentation on how to do this navigation is covered in `.vimrc` file.

Additionally you can set your python interpreter by - `:CocCommand python.setInterpreter`.
