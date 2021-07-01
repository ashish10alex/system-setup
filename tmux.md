# Tmux setup 

Setup [tmux plugin manager](https://github.com/tmux-plugins/tpm)

```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Now add following lines to `~/.tmux.conf` (create file if not present)

```
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
set -g @plugin 'tmux-plugins/tmux-resurrect'

run -b '~/.tmux/plugins/tpm/tpm'
```

We use [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) to preserve tmux sessions over reboots.

Now source the `~/.tmux.conf` file by running 

```
# type this in terminal if tmux is already running
$ tmux source ~/.tmux.conf
```

Go inside any of your your `tmux` sessions and Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch
the plugin. Currently my prefix is the same as default <kbd>CTLR</kbd> + b

Now you can - 
 * save sessions using `prefix` + <kbd>CTLR</kbd> + s
 * restore sessions using `prefix` + <kbd>CTLR</kbd> + r

