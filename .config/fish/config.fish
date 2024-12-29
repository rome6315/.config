if status is-interactive
    # Commands to run in interactive sessions can go here
  #set -g fish_term24bit 0  
  set TERM "xterm-256color"
  set fish_greeting #remove fish greeting

  starship init fish | source #enable starship

  set FO_NERDFONTS "1" 

  nitch #run sys fetch

  function fish_user_key_bindings
    fish_vi_key_bindings #use vim bindings
  end
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

# Functions needed for !! and !$
  function __history_previous_command
    switch (commandline -t)
    case "!"
      commandline -t $history[1]; commandline -f repaint
    case "*"
      commandline -i !
    end
  end
  
  function __history_previous_command_arguments
    switch (commandline -t)
    case "!"
      commandline -t ""
      commandline -f history-token-search-backward
    case "*"
      commandline -i '$'
    end
  end
  # The bindings for !! and !$
  if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
  else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
  end
  ##END OF ADDING !! AND !$

# end of file
end
