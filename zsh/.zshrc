# Setup ZPlug
if [[ ! -f ${ZDOTDIR:-${HOME}}/.config/zsh/zplug/init.zsh ]]; then
  command git clone https://github.com/zplug/zplug.git ${ZDOTDIR:-${HOME}}/.config/zsh/zplug
fi

source ${ZDOTDIR:-${HOME}}/.config/zsh/zplug/init.zsh

# Plugins
zplug "zsh-users/zsh-autosuggestions"               #Command suggestions
zplug "zsh-users/zsh-syntax-highlighting"           #Highlighting for commands
zplug "zsh-users/zsh-completions"                   #More completions for zsh
zplug "zsh-users/zsh-history-substring-search"      #Search prev commands via substr
zplug "ChrisPenner/copy-pasta"                      #Allows copy and paste of files
zplug "mdumitru/fancy-ctrl-z"                       #Enable ctrl z to toggle between two instances of terminal
zplug "b4b4r07/enhancd", use:init.sh                #better cd
zplug "jeffreytse/zsh-vi-mode"                      #Vi Mode

if ! zplug check --verbose; then
  echo; zplug install
fi

zplug load 
ENHANCD_FILTER=fzy:fzf:peco
export ENHANCD_FILTER

# History Settings
HISTFILE=~/.config/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000

setopt inc_append_history
setopt extended_history

#  Alias'
alias ls='exa'
alias lsa='exa -a'
alias lS='exa -1'
alias lT='exa --tree'

alias lt='exa --tree --level=2'
alias vi="nvim"
alias vim="nvim"

alias grep='grep --color=auto'

alias mkdir='mkdir -pv'

alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias ..='cd ../'
alias .='cd ~'

#  List all mounted devices and their mount locations in a readable way 
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | grep -E --color=auto ^/dev/ | sort"

# Package Managment
alias search='yay -Ss'
alias install='yay -S'
alias update='yay -Syu --devel'
alias uninstall='yay -Rs'
alias clean='yay -Yc'

alias gendb='yay -Y --gendb'

alias bckMirrors='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup'
alias upMirrors='sudo systemctl start reflector.service &'

# Misc Settings
export EDITOR="nvim"
unsetopt autocd
unsetopt beep

typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ad8ee6" 
typeset -g ZSH_AUTOSUGGEST_STRATEGY=(completion)

PROMPT='%F{blue}%2~ %F{green}> '
RPROMPT="%F{#acb0d0}%t"

# opam configuration [OCaml]
[[ ! -r /home/Tim/.opam/opam-init/init.zsh ]] || source /home/Tim/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

path+=('/home/Tim/.local/bin')
export PATH

# bun completions
[ -s "/home/Tim/.bun/_bun" ] && source "/home/Tim/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
