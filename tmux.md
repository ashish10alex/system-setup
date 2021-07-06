# tmux setup 

tmux is an open-source terminal multiplexer for Unix-like operating systems. It allows multiple terminal sessions to be
accessed simultaneously in a single window(<i>wiki</i>).

To setup tmux with my [config file](https://github.com/ashish10alex/system-setup/blob/main/.tmux.conf) 

```
git clone https://github.com/ashish10alex/system-setup
cd system-setup 
cp .tmux.conf ~/.tmux.conf
```

Install [Tmux plugin manager](https://github.com/tmux-plugins/tpm)
```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

From the terminal source the tmux configuration by running 
```
$ tmux source ~/.tmux.conf
```

You can make changes and reload tmux config using - `prefix` + <kbd>SHIFT</kbd> + r 

Refer to [tmux cheat sheet](https://tmuxcheatsheet.com) to get started with tmux

## Plugins

#### [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) 

Preserves tmux sessions over reboots.

Now source the `~/.tmux.conf` file by running 

```
# type this in terminal if tmux is already running
$ tmux source ~/.tmux.conf
```

Go inside any of your your `tmux` sessions and Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch
the plugin. Currently my `prefix` is the same as default <kbd>CTLR</kbd> + b

Now you can - 
 - save sessions using `prefix` + <kbd>CTLR</kbd> + s
 - restore sessions using `prefix` + <kbd>CTLR</kbd> + r


#### [Fzf integration with tmux](https://github.com/sainnhe/tmux-fzf)

Easy management of windows, sessions, invoked by - `prefix` + <kbd>SHIFT</kbd> + f

