Install brew package manager

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Iterm2 instead of regular terminal
```
brew install --cask iterm2
```

Install necessary packages using brew

```
brew install wget

brew install fzf
/usr/local/opt/fzf/install

brew install bat
brew install tmux
```

Configure `ohmyzsh` shell 

```
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
```

Configure auto-suggestions for ohmyzsh

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Configure syntax highlighting in zsh; aka correct shell commands show in green
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

Setup vim development environment
```
git clone https://github.com/ashish10alex/system-setup.git
cd system-setup
cp .vimrc ~/
#install plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
source ~/.vimrc

vi ~/.vimrc
:PlugInstall
```

Add plugins to `.zshrc` file

```
plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
  zsh-autosuggestions
)
```


