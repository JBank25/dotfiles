
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/joshuaurbank/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/joshuaurbank/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/joshuaurbank/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/joshuaurbank/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# alias
alias gu='git add -u'
alias gc='git commit -m'
alias gs="git status"
alias ll="ls -Gl"
alias ls="ls -G"

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
autoload -Uz vcs_info
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


# vi keybindings
bindkey -v
export KEYTIMEOUT=1

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Edit line in vim with ctrl-x ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Vi mode cursor shape configuration for Zsh
# Changes cursor appearance based on current vi editing mode

# Function: zle-keymap-select
# Purpose: Automatically change cursor shape when switching between vi modes
# Triggered: Every time the keymap changes (e.g., pressing Escape or 'i')
# Parameters: Uses global $KEYMAP variable set by zle
function zle-keymap-select {
  case $KEYMAP in
    vicmd) echo -ne '\e[1 q' ;;    # Block cursor (█) for command mode
    viins|main) echo -ne '\e[5 q' ;; # Beam cursor (|) for insert mode
  esac
}
# Register the function as a zle widget
zle -N zle-keymap-select

# Function: zle-line-init
# Purpose: Set initial cursor shape and mode when starting a new command line
# Triggered: When zle starts editing a new line (new prompt appears)
# Ensures: Always start in insert mode with appropriate cursor
zle-line-init() {
  zle -K viins          # Force into insert mode
  echo -ne '\e[5 q'     # Set beam cursor to match insert mode
}
# Register the function as a zle widget
zle -N zle-line-init

# Function: preexec
# Purpose: Reset cursor shape before command execution
# Triggered: Just before any command is executed
# Ensures: Cursor returns to beam shape after command completes
# Note: This prevents the cursor from staying as a block if you were
#       in command mode when you pressed Enter
preexec() {
  echo -ne '\e[5 q'     # Reset to beam cursor
}


# fzf stuff
# Set up fzf key bindings and fuzzy completion, enables the ctrl+r keybinding
source <(fzf --zsh)
# preview filew when doing fzf search
pf='fzf --preview='\''bat --color=always --style=plain {}'\'' --bind k:preview-up,j:preview-down'


# Had to reference this to fix issue with alt-c not working https://github.com/junegunn/fzf/issues/164
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

eval "$(starship init zsh)"

# Load syntax highlighting; should be last.
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

