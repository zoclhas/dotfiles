# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Autostart Hyprland at Login
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec Hyprland
fi

# Aliases
alias q='exit'
alias ..='cd ..'
alias ls='lsd -Fl'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias t='tree'
alias rm='rm -v'
alias open='xdg-open'

alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias nv='neovide'

alias gs='git status'
alias ga='git add -A'
alias gc='git commit'
alias gpll='git pull'
alias gpsh='git push'
alias gd='git diff'
alias gl='git log --stat --graph --decorate --oneline'

alias pu='sudo pacman -Syu'
alias pi='sudo pacman -S'
alias pr='sudo pacman -Rsu'
alias pq='sudo pacman -Qe'
alias autoclean='sudo pacman -Qtdq | sudo pacman -Rns - && yay -Sc'

alias cr='cargo run'
alias cb='cargo build'
alias ct='cargo test'
alias clippy='cargo clippy'

alias lock='swaylock'
alias standby='systemctl suspend'

alias b='bat'
alias rr='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias z='zathura'

# Colored output
#alias ls='ls -laGH --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

# Colored pagers
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER='less -R --use-color -Dd+r -Du+b'
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Setting Default Editor
export EDITOR='nvim'
export VISUAL='nvim'

# File to store ZSH history
export HISTFILE=~/.zsh_history

# Number of commands loaded into memory from HISTFILE
export HISTSIZE=99999

# Maximum number of commands stores in HISTFILE
export SAVEHIST=1000

# Setting default Ranger RC to false to avoid loading it twice
export RANGER_LOAD_DEFAULT_RC='false'

# Loading ZSH modules
autoload -Uz compinit
autoload -Uz vcs_info # Git

# Style control for completion system and VCS
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' rehash true                      # Rehash so compinit can automatically find new executables in $PATH
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats 'on %F{red} %b%f '    # Set up Git Branch details into prompt

# Match dotfiles without explicitly specifying the dot
compinit
_comp_options+=(globdots)

# Load Version Control System into prompt
precmd() { vcs_info }

# Prompt Appearance
setopt PROMPT_SUBST

PS1='%B%F{green}❬%n%f@%F{green}%m❭%f %F{blue} %1~%f%b ${vcs_info_msg_0_}>===> '

# XDG user dirs
source ~/.config/user-dirs.dirs

# Keybindings for FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# ZSH Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH Syntax Highlighting - must be at the end of .zshrc!
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Launch pfetch when opening new terminal
# pfetch

# Custom
alias py="python3" 
alias ga="git add ." 
alias gc="git commit" 
alias gP="git push" 
alias gp="git pull" 
alias gs="git stash"
alias gd="git diff"
alias djM="py manage.py makemigrations" 
alias djm="py manage.py migrate" 
alias djr="py manage.py runserver" 
alias pmg="py manage.py"
alias vim="nvim"
alias vi="nvim"
alias cat="bat"
alias bat="bat"
alias zel="zellij"
alias z="zellij"
alias :q="exit"
alias yeet="rm"

alias adstd="/opt/android-studio/bin/studio.sh"

alias shadow="zsh ~/add_shadow.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

mkcd() {
  if [ -n "$1" ]; then
    mkdir -p "$1" && cd "$1"
  else
    echo "Usage: mkcd <folder_name>"
  fi
}

gacp() {
  if [ -n "$1" ]; then
    ga . && gc -m "$1" && gP
  else
    echo "Usage: gacp <commit_message>"
  fi
}

ncd() {
  if [ -n "$1" ]; then
    cd "$1" && nvim .
  else
    echo "Usage: ncd <dir>"
  fi
}
. "$HOME/.cargo/env"



# bun completions
[ -s "/home/zoc/.bun/_bun" ] && source "/home/zoc/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
