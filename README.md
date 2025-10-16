
# ChadDots

---

my dotfiles for shell and cli apps  
these are for a debian based systems and uses apt to install apps/dependencies  
you will need to edit this to run on other distros  
most of the keybinds are default but you will need to read the config to see the additional ones  

#### configs
- bash
- vim
- ranger
- tmux
- fastfetch

## How to Install
run the setup script to install apps and dependencies (check script before installing)  
follow the prompts provide  
dotfiles are linked using [stow](https://www.gnu.org/software/stow/). select which ones or all you want to link
```
bash setup.sh

```

## Post Install
all apps except vim and tmux will be configured once you reload your bashrc  
you will need to install the plugins in vim and tmux directly  

#### Vim
open vim and execute the following command  
```
:PluginInstall

```
this will open vim plugin manager and start downloading the plugins  
once all plugins are downloaded you can relaunch vim  

all plugins should work out of the box except [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)  
to fully install you need to compile manually. see official site for more details.
exit vim and navigate to the plugin folder  
```
cd ~/.vim/bundle/YouCompleteMe

```
once in folder run the install python file
this will install the base languages. for all options use the --all flag after the file  
```

python3 install.py

```
if this completes successfully you should be all set  

#### Tmux
launch tmux and start the plugin manager  
by hitting the prefix key followed by I  
*important that this is a capital "I" to launch tpm  
```

Ctrl-a I

```

That should be everything  

Good Luck!


---
