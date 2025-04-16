

* `settings.json` key bindings to navigate errors and git hunks.

* `keybindings.json` enables `ctrl + n` , `ctrl + p` navigation of items. Can be found by `ctlr + shift + p` followed by `Preferences: Open Keyboard Shortcuts (JSON)`



Windows platform quirks

1. To enable navigation of terminal history using `ctrl + n` , `ctrl + p` you will have to block `ctrl + p` from triggering the `workbench.action.quickOpen` as follows

   Open Keyboard Shortcuts: In VS Code, go to File > Preferences > Keyboard Shortcuts (or Code > Settings > Keyboard Shortcuts). In the search bar at the top of the Keyboard Shortcuts editor, type "workbench.action.quickOpen". This is the command that's likely bound to ctrl + p.
Add a When Clause. Right-click on the "workbench.action.quickOpen" entry and select "Change When Expression" by right clicking the text box add add `!terminalFocus` to it such that when we are using the termaial `ctrl + p` does not trigger "workbench.action.quickOpen". 



