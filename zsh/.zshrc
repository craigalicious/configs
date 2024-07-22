# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set zsh theme
ZSH_THEME="robbyrussell"

# Set fzf installation directory path
export FZF_BASE=~/.fzf

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    fzf
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Fix omz slow pasting
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/295#issuecomment-214581607
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# replace folder name with %~ to include full path, or %n~ to include n depth
# https://stackoverflow.com/questions/34623956/how-to-get-absolute-path-on-a-zsh-prompt
PROMPT=${PROMPT/\%c/\%3~}

# fix my expected ll alias
alias ll='ls -la'

# source environment variables
if [ -f "$HOME/.zshenv" ]; then
    source "$HOME/.zshenv"
fi

# source docker env
# source ~/github/FlightSystems/docker_fun.sh

