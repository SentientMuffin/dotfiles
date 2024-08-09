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

source ~/.zsh_env_vars

. ~/z.sh

# run in new tab
function runInNewTab() {  
    osascript >/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
      tell process "Terminal" to keystroke "$*"
      delay 0.5
      tell process "Terminal" to key code 36
    end tell
EOF
}

# Run workflow for Activate+Accounts 
alias aa='runInNewTab ActivateAndAccounts'
function ActivateAndAccounts() {
  eval repos
  eval cd lane-next
  eval yarn start
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
