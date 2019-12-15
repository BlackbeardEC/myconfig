# Path to your oh-my-zsh installation.
export ZSH=/home/blackbeard/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="blackbeard"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux jump systemd)

source $ZSH/oh-my-zsh.sh

# User configuration
# BEGIN tmux fuckery with not reading $PATH from ~/.zshenv

# Trying to fix my paths
export ANDROID_HOME=$HOME/Android/Sdk
export GOPATH=/home/blackbeard/code/go
export GOBIN=/home/blackbeard/code/go/bin

PATH=:/home/blackbeard/.local/bin:/home/blackbeard/.local/bin/colors:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:~/.scripts:~/.config/bspwm:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$GOPATH/bin:/home/blackbeard/perl5/bin:/home/blackbeard/.gem/ruby/2.6.0/bin:~/.cargo/bin

# Trying to add back these perl paths and variables to fix problems
PERL5LIB="/home/blackbeard/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/blackbeard/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/blackbeard/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/blackbeard/perl5"; export PERL_MM_OPT;

export PATH;

# More Twily stuff -- Dircolors
# LS_COLORS='rs=0:di=01;36:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;36:';
# export LS_COLORS

export EDITOR=/usr/bin/vim
export BROWSER=/usr/bin/firefox

export MATES_DIR=~/.contacts

export FZF_DEFAULT_OPTS='
    --no-height --no-reverse --multi
    --color=fg:#98c196,bg:#142429,hl:#25b84f
    --color=fg+:#e36b6b,bg+:#142429,hl+:#ff3b62
    --color=info:#30b862,prompt:#ff0000,pointer:#a3ff47
    --color=marker:#8cf022,spinner:#18f092,header:#87afaf
    '

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# zle -N FZF_CTRL_T_OPTS
# bindkey '^T' FZF_CTRL_T_OPTS

# END tmux fuckery


# Commenting out this nvm crap because it's making my prompt slow to show up after opening terminal. and I only need this when I'm going to be changing node versions.
# nvm crap because it failed to do it on it's own
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#vi-mode
# bindkey -v
bindkey '^R' history-incremental-search-backward

# Trying to fix the way zsh searches history with up/down, the way it does without the vi-mode above

autoload -Uz history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey -M vicmd '^[[A' history-beginning-search-backward-end \
                 '^[OA' history-beginning-search-backward-end \
                 '^[[B' history-beginning-search-forward-end \
                 '^[OB' history-beginning-search-forward-end
bindkey -M viins '^[[A' history-beginning-search-backward-end \
                 '^[OA' history-beginning-search-backward-end \
                 '^[[B' history-beginning-search-forward-end \
                 '^[OB' history-beginning-search-forward-end

# Enable Zsh command highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $HOME/.aliases
#source $HOME/.zsh-interactive-cd.plugin.zsh
# source /usr/share/fzf/key-bindings.zsh
# source /usr/share/fzf/completion.zsh
