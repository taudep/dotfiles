# Source each file one by one
# Just import the bash_alianses for now, others could be added, though: bash_exports,bash_virtualenvwrapper,
for file in ~/.{bash_aliases};do
    [ -r "$file" ] && source "$file"
done
unset file

export SUDO_PS1="\\[\h:\w\] \u\\$  "
export PS1="\u:\h\w$ "
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11R6/bin

# Add GO
export PATH=$PATH:/usr/local/go/bin

# Add VirtualWrapper
source /usr/local/bin/virtualenvwrapper.sh

# Add git Completion
source /usr/local/etc/bash_completion.d/git-completion.bash

# Add Tab-completion for SSH Config hosts
complete -o default -o nospace -W "$(/usr/bin/ruby -ne 'puts $_.split(/[\s,]+/)[1..-1].reject { |h| h.match /\*|\?/ } if $_.match /^\s*Host[s]*\s+/' < ~/.ssh/config)" scp sftp ssh 2>/dev/null

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Custom prompt for git
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# alias emacs="/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs -nw"


alias em='emacs -nw'     # No X11 windows                                                                                                                                                                 
alias eqq='emacs -nw -Q' # No config and no X11                                                                                                                                                           
export EDITOR='emacs -nw'
export VISUAL='emacs -nw'

# 2.7) node.js and nvm                                                                                                                                                                                    
# http://nodejs.org/api/repl.html#repl_repl                                                                                                                                                               
alias node="env NODE_NO_READLINE=1 rlwrap node"
alias node_repl="node -e \"require('repl').start({ignoreUndefined: true})\""
export NODE_DISABLE_COLORS=1
if [ -s ~/.nvm/nvm.sh ]; then
    NVM_DIR=~/.nvm
    source ~/.nvm/nvm.sh
    nvm use v0.10.12 &> /dev/null # silence nvm use; needed for rsync                                                                                                                                     
fi
