# -------------------------------
# History
# -------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# -------------------------------
# Completion
# -------------------------------
autoload -Uz compinit
compinit

# -------------------------------
# Prompt (Powerlevel10k)
# -------------------------------
# instant prompt (fast startup)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# theme
[[ -f ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme ]] && \
  source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# config
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# -------------------------------
# Plugins (only if installed)
# -------------------------------
# autosuggestions
[ -f ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
  source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
[ -f ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ] && \
  source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# -------------------------------
# zoxide (smart cd)
# -------------------------------
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# -------------------------------
# Aliases
# -------------------------------
alias c='clear'
alias lah='ls -al'
alias k='kubectl'

# dev shortcuts
alias play='cd ~/projects'
alias dots='cd ~/projects/dots'
alias config='cd ~/.config'

# maven / spring
alias sbr='./mvnw spring-boot:run'
alias mvnc='./mvnw compile'
alias mvnr='./mvnw clean install -U'


# Basic Navigation & Status
alias gss='git status'
alias gaa='git add .'
alias gcm='git commit -m'
alias gpp='git push'
alias gpl='git pull'

# Branching
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'

# Undo last commit: Keeps your changes but "uncommits" them
alias gundo='git reset --soft HEAD~1'
# Quick Amend: Add changes to the last commit without changing the message
alias gca='git commit --amend --no-edit'
# Pretty Log: View a graphical, colorized timeline of commits
alias glog="git log --graph --pretty=format:'%C(auto)%h%Creset - %C(white)%s%Creset %C(green)(%ad)%Creset %C(bold blue)<%an>%Creset%C(auto)%d' --date=short"
# -------------------------------
# pnpm (optional)
# -------------------------------
export PNPM_HOME="$HOME/.local/share/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
