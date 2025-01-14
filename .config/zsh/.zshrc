# zsh config

##### ENVIRONMENT VARS #####
export TERM=xterm-256color
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml # change starship config location
export EDITOR=nvim # neovim
export XDG_PICTURES_DIR=$HOME/Pictures/
##### END ENVIRONMENT VARS #####

##### OPTIONS #####
unsetopt BEEP # annoying
setopt appendhistory # append to history instead of overwrite/prepend
##### END OPTIONS #####


##### ALIAS'S #####

#just incase :)
alias vim='nvim' 

alias hx='helix' # helix alias

  # chnaging grep to ripgrep
alias grep='rg'

alias find='fd' # changing find to fd
alias cat='bat' # changing cat to bat

alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME' #bare git repo to push/pull my config

alias spacehog='du -Sh | sort -rh | head -10' #display top 10 directories that take up most space

alias mem='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head' # list programs using the most ram and cpu

# Changing "ls" to "eza", got these from DistroTube
alias ls='eza -la --color=always --group-directories-first --icons=always' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
##### END ALIAS'S #####


##### KEYBINDS #####
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
##### END KEYBINDS #####

##### HISTORY SETTINGS #####
HISTSIZE=10000              # The maximum number of history entries to keep in memory
SAVEHIST=10000              # The maximum number of history entries to save in the history file
HISTFILE=~/.zsh_history      # Path to the history file
##### END HISTORY SETTINGS #####

##### PLUGINS #####
nitch # run system fetch
eval "$(starship init zsh)" # init prompt config
source <(fzf --zsh) # Set up fzf key bindings and fuzzy completion
# load history and highlighting plugins
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOME/.config/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh
##### END PLUGINS #####
