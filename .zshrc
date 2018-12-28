# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/blackbeard/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="blackbeard"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux common-aliases chucknorris jump web-search systemd)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Trying to fix my paths
export ANDROID_HOME=$HOME/Android/Sdk
export GOPATH=/home/blackbeard/code/go

PATH=:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:~/.scripts:~/.config/bspwm:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$GOPATH/bin:/home/blackbeard/.local/bin:/home/blackbeard/.local/bin/colors

export PATH;

# export PATH=~/.scripts:~/.config/bspwm:$PATH
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:/home/blackbeard/.local/bin
# export PATH=$PATH:/home/blackbeard/.local/bin/colors


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

mem10(){
    ps aux --sort=-%mem | awk 'NR<=10{print $2,"\t", $11,"\t", $12}';
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
#alias vol="amixer get Master | tail -n1 | awk '{ print $5 }' | tr -d '[]'"
#alias ohmyzsh="vim ~/.oh-my-zsh"
alias l="ls -1sh"
alias lla="ls -la"
alias cdc="cd"
alias poop="sudo shutdown -h now"
#alias extract="/usr/bin/extract"
alias netbeans="netbeans -J-Dswing.aatext=true -J-Dawt.useSystemAAFontSettings=on &"
alias bnet="\"/home/blackbeard/bnet/drive_c/Program Files (x86)/Battle.net/Battle.net Launcher.exe\""
alias -g gp="| grep -i"
alias j="jump"

# CD aliases you know what I'm just gonna make these jump marks
alias gh="cd ~/ && l"
alias gc="cd ~/.config && l"

alias ping="ping -c 5"
alias clr="clear; echo Currently logged in on $TTY, as $USER in directory $PWD."
alias path="print -l $path"
alias mkdir="mkdir -pv"
alias psmem="ps -e -orss=,args= | sort -b -k1,1n"
alias psmem10="ps -e -orss=,args= | sort -b -k1,1n | head -10"
alias pscpu="ps -e -o pcpu,cpu,nice,state,cputime,args |sort -k1 -nr"
alias pscpu10="ps -e -o pcpu,cpu,nice,state,cputime,args |sort -k1 -nr | head -10"
alias hist10="print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10"


# Trying to fix unicode characters
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export EDITOR=/usr/bin/vim
export BROWSER=/usr/bin/qutebrowser


PATH="/home/blackbeard/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/blackbeard/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/blackbeard/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/blackbeard/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/blackbeard/perl5"; export PERL_MM_OPT;
alias config='/usr/bin/git --git-dir=/home/blackbeard/.myconfig/ --work-tree=/home/blackbeard'
