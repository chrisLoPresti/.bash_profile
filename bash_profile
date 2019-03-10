export PATH="$PATH:/usr/local/bin/" # [change this to be specific to your machine]

# Command line aliases

alias cp='cp -iv' 					# Preferred 'cp' implementation
alias mv='mv -iv' 					# Preferred 'mv' implementation
alias mkdir='mkdir -pv' 			# Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'    			# Preferred 'ls' implementation
alias less='less -FSRXc' 			# Preferred 'less' implementation

	# Alias' for changing directories
	alias cd..='cd ../'
	alias ..='cd ../'
	alias .1='cd ../'
	alias .2='cd ../../'
	alias .3='cd ../../../'
	alias .4='cd ../../../../'
	alias .5='cd ../../../../../'
	alias .6='cd ../../../../../../'

alias edit='subl'					# edit: Opens any file in sublime editor
alias f='open -a Finder ./'			# f: Opens current dir in MacOS Finder
alias ~='cd ~'						# ~: Go to home directory
alias c='clear'						# c: Clear terminal
alias which='type -all'				# which: Find executable
alias path='echo -e ${PATH//:/\\n}' # path: Echo all executable Paths

	# Update brew
	alias brewup='brew update; brew upgrade; brew cleanup --prune-prefix; brew doctor'

	# Personal path shortcuts [change these to be specific to your machine]
	alias doc='cd ~/documents'
	alias desk='cd ~/desktop'
	alias gocode='cd ~/code'

# Alias Functions

mcd () { mkdir -p "$1" && cd "$1"; }	# mcd: Makes new dir and enters it
trash () { command mv "$@" ~/.Trash ; } # trash: Moves file to trash

# Change colors for terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Git

	#adds git branch to terminal prompt
	parse_git_branch() {
  		git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
	}
	export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\$(parse_git_branch)\[\033[m\]\$ "

alias uninit='rm -rf .git'			 # uninit: Removes .git
alias remote='git remote --v'		 # remote: Gets git repo url

# Utility functions

	# extract most common files
	extract () {
		if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1     ;;
			*.tar.gz)    tar xzf $1     ;;
			*.bz2)       bunzip2 $1     ;;
			*.rar)       unrar e $1     ;;
			*.gz)        gunzip $1      ;;
			*.tar)       tar xf $1      ;;
			*.tbz2)      tar xjf $1     ;;
			*.tgz)       tar xzf $1     ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)     echo "'$1' cannot be extracted via extract()" ;;
			esac
		else
			echo "'$1' is not a valid file"
		fi
	}