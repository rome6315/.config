# zsh config

##### ENVIRONMENT VARS #####
export TERM=xterm-256color
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export EDITOR=nvim
##### END ENVIRONMENT VARS #####

##### ALIAS'S #####
#just incase :)
alias vim='nvim' 

  # chnaging grep to ripgrep
alias grep='rg'

alias find='fd' # changing find to fd
alias cat='bat' # changing cat to bat

alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME' #bare git repo to push/pull my config

alias spacehog='du -Sh | sort -rh | head -10' #display top 10 directories that take up most space

# Changing "ls" to "exa"
alias ls='exa -la --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
##### END ALIAS'S #####


##### HISTORY SETTINGS #####
HISTSIZE=10000              # The maximum number of history entries to keep in memory
SAVEHIST=10000              # The maximum number of history entries to save in the history file
HISTFILE=~/.zsh_history      # Path to the history file
setopt appendhistory
##### END HISTORY SETTINGS #####


##### PLUGINS #####
nitch
eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
##### END PLUGINS #####
