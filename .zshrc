# Shell entry prompt
# echo "Welcome to Terminal, \033[38;5;025;1m$USER\033[0m!"
#echo "\033[1mCommands\033[0m: \033[0;34monedrive \033[0m"
#echo "\033[1mCommands\033[0m: \033[0;34mgithub \033[0m"
#echo "\033[1mCommands\033[0m: \033[0;34mprojects \033[0m"

export PATH="/usr/local/bin:/usr/bin:$PATH"

export EDITOR="code"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setting PATH for Python 3.8
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Make vim the homebrew version
#alias vim=/usr/local/Cellar/vim
PATH="usr/local/bin/vim:$PATH"

# For Ruby
PATH="$HOME/.gem/ruby/2.7.1/bin:$PATH"

# Chruby
source /usr/local/share/chruby/chruby.sh

# Dev Tool
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
if [ -e /Users/alexchan/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/alexchan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Shell login functions
alias dus="dev up && dev s"
alias dup="dev up"
alias gpdus="git checkout master && git pull origin master && dev up && dev s"
alias grbm="git fetch origin master && git rebase origin/master"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
rsync3000a () {
	rsync -a student@134.117.129.42:~/assignments/assignment"$1"/alexchan3-comp3000-assign"$1".txt ~/OneDrive\ -\ Carleton\ University/COMP\ 3000/assignments
}
rsync3000t () {
	rsync -a student@134.117.129.42:~/tutorials/tutorial0"$1"/alexchan3-comp3000-t"$1".txt ~/OneDrive\ -\ Carleton\ University/COMP\ 3000/tutorials
}
rsync2404 () {
	rsync -a ~/OneDrive\ -\ Carleton\ University/COMP\ 2404/src/ student@134.117.129.42:~/2404src
}
work () {
	dev cd shopify
	dev up
	ttab 'dev hedwig enqueuer'
	ttab 'ENABLE_CAPTAIN_HOOK=true dev hedwig worker'
	ttab -d ~/src/github.com/Shopify/captain-hook 'dus'
	dev s
}
work2 () {
  dev cd shopify
  ttab -t 'graphiql' -d ~/src/github.com/Shopify/shopify-graphiql-app 'dev up; ttab -t graphiql-console dev console; open mysql://root:@shopify-graphiql-app.railgun:3306/shopify-graphiql-app_development -a Sequel\ Ace; ttab -w nvim; dev s'
  dev up
  open "mysql://root:@shopify.railgun:3306/shopify_dev_shard_0" -a "Sequel Ace"
  ttab -t 'shopify-console' dev console
  dev s
}
github () {
    if [ $# -eq 0 ]
    then
      cd $HOME/src/github.com
    else
      cd $HOME/src/github.com/"$1"
    fi
}
projects () {
    if [ $# -eq 0 ]
    then
      cd $HOME/projects
    else
      cd $HOME/projects/"$1"
    fi
}
alias font-patcher="python3 ~/Documents/font-patcher"
onedrive () {
	if [ $# -eq 0 ]
	then
		cd /Users/alexchan/"OneDrive - Carleton University"
	else
		cd /Users/alexchan/"OneDrive - Carleton University"/"COMP $1/"
	fi
}
oni2-update () {
	cd ~/src/github.com/oni2	
	git pull
	esy install
	esy bootstrap
	esy build
	esy '@release' install
	esy '@release' run --help
	esy '@release' create
	./_release/Onivim2.app/Contents/MacOS/Oni2 -f --checkhealth
	cp -R _release/Onivim2.app /Applications
}

# Bindkeys
bindkey -v

# Autosuggest
#bindkey '^[[C' autosuggest-execute
#ZSH_AUTOSUGGEST_STRATEGY=(completion history)

################  START OF ORIGINAL ##################
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/alexchan/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(
    git
    zsh-autosuggestions 
    zsh-syntax-highlighting
    rails
    npm
    vi-mode
    #zsh-completions
)
autoload -U compinit
compinit

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/usr/local/opt/llvm/bin:$PATH"

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[[ -x /usr/local/bin/brew ]] && eval $(/usr/local/bin/brew shellenv)
