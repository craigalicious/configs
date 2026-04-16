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

# Codex aliases. Varying levels of autonomy vs risk.
# -s workspace-write
#   - Codex can read broadly, and write in the workspace plus any --add-dir paths.
#   - Grep/search/read files is generally fine.
#   - Running Python/scripts is generally fine if they only touch the repo, /tmp, and other allowed dirs.
#   - If a command needs to modify arbitrary places on your machine, open GUIs, or access blocked paths, it will fail instead of prompting when paired with -a never.
codex-safe() {
  command codex \
    --search \
    -a on-request \
    -s workspace-write \
    --add-dir /tmp \
    --add-dir "$HOME/.aws" \
    --add-dir "$HOME/.cache/bazel" \
    --add-dir "$HOME/.cache" \
    "$@"
}
#  -s danger-full-access
#   - Codex can run commands directly on your host with essentially no filesystem sandbox.
#   - It can modify files outside the repo: home dir, git config, ssh files, dotfiles, system-accessible paths, etc.
#   - Much more convenient, but mistakes are real mistakes on your machine.
codex-unsafe() {
  command codex --search -s danger-full-access "$@"
}

# Prefer zip_ipc from current FlightSystems
alias zip_ipc="/home/craig.rohe/github/FlightSystems/.environment/pigweed-venv/bin/zip_ipc"

# Added by FlightSystems bootstrap
export PATH=$HOME/.local/bin:$PATH

# Added by FlightSystems bootstrap
eval "$(direnv hook zsh)"

# Add Rust tooling when installed locally so repo hooks like rustfmt can run.
[[ -d "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"

# Zipline env (added by cloud -> build_tools/setup-environment)
source /home/craig.rohe/.config/zipline/env
