# Pretty command prompt
export PS1='∫∫∫: '
export PS2='ƒ: '

# Unbind ESC in insert mode (optional)
bindkey -e
# bindkey -v
# bindkey -M viins '\e' undefined-key

eval "$(/opt/homebrew/bin/brew shellenv)"

# alias
# alias repos='pwd | cd ~/Documents/VTS/repos'
alias zsh='nvim ~/.zshrc'
alias gds='git diff --shortstat'
alias rs='fg'
# alias runall='/Users/xinjun.lin/Documents/VTS/repos/personalNotes/bpRunScript'
# alias tst='/Users/xinjun.lin/tmuxStart'
# alias nviml='nvim -u ~/.dotfiles/home/.config/nvim/init-wip.lua'
alias ll='{pwd && ls -lah | tail --lines=+2;}'

# git shorthands
alias gn='git rev-parse --abbrev-ref HEAD | pbcopy && echo "Branch name copied to clipboard"'
alias gp='git pull'
alias gpb='git push -u origin HEAD'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gs='git status'

# alias lint='npx eslint --fix'

export EDITOR=nvim
# source ~/.zsh_env_vars

# zsh prompts
zstyle :prompt:pure:git:arrow color "#f16c75"
zstyle :prompt:pure:git:branch color "#04d1f9"
zstyle :prompt:pure:path color "#37f499"
zstyle :prompt:pure:prompt:error color "#f16c75"
zstyle :prompt:pure:prompt:success color "#37f499"
zstyle :prompt:pure:prompt:continuation color "#f7c67f"
zstyle :prompt:pure:suspended_jobs color "#f16c75"
zstyle :prompt:pure:user color "#a48cf2"
zstyle :prompt:pure:user:root color "#f1fc79"

# Z jump around
. ~/z.sh

zle-keymap-select () {
  case $KEYMAP in
    vicmd) print -rn -- $terminfo[cvvis];; # block cursor
    viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
  esac
}
# zle -N zle-keymap-select
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add GOPATH
export PATH="$PATH:$(go env GOPATH)/bin"

# FZF config
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--color=fg:#ebfafa,bg:#282a36,hl:#37f499 --color=fg+:#ebfafa,bg+:#212337,hl+:#37f499 --color=info:#f7c67f,prompt:#04d1f9,pointer:#7081d0 --color=marker:#7081d0,spinner:#f7c67f,header:#323449'


# Added by Windsurf
export PATH="/Users/powelllin/.codeium/windsurf/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
