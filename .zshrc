typeset -U name_of_the_variable

# Pretty command prompt
export PS1='∫∫∫: '
export PS2='ƒ: '

# alias
alias repos='pwd | cd ~/Documents/VTS/repos'
alias zsh='nvim ~/.zshrc'
alias gds='git diff --shortstat'
alias rs='fg'
alias runall='/Users/xinjun.lin/Documents/VTS/repos/personalNotes/bpRunScript'
alias tst='/Users/xinjun.lin/tmuxStart'
alias nviml='nvim -u ~/.dotfiles/home/.config/nvim/init-wip.lua'
alias ll='{pwd && ls -lah | tail --lines=+2;}'
alias gb='git rev-parse --abbrev-ref HEAD | pbcopy && echo "Branch name copied to clipboard"'
alias lint='npx eslint --fix'

export EDITOR=nvim
source ~/.zsh_env_vars

# styling
# FZF Plugin
export FZF_DEFAULT_OPTS='--color=fg:#ebfafa,bg:#282a36,hl:#37f499 --color=fg+:#ebfafa,bg+:#212337,hl+:#37f499 --color=info:#f7c67f,prompt:#04d1f9,pointer:#7081d0 --color=marker:#7081d0,spinner:#f7c67f,header:#323449'

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

. ~/z.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"
