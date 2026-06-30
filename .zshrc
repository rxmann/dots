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
alias gba='git branch --all'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'
alias gfp='git fetch --prune'

# Undo last commit: Keeps your changes but "uncommits" them
alias gundo='git reset --soft HEAD~1'
# Quick Amend: Add changes to the last commit without changing the message
alias gca='git commit --amend --no-edit'
# Pretty Log: View a graphical, colorized timeline of commits
alias glog="git log --graph --pretty=format:'%C(auto)%h%Creset - %C(white)%s%Creset %C(green)(%ad)%Creset %C(bold blue)<%an>%Creset%C(auto)%d' --date=short"




# 1. Middle-ground balanced profile (Runs cooler, safe for battery)
alias gpu-balanced="echo 700 | sudo tee /sys/class/drm/card1/gt_min_freq_mhz && echo 700 | sudo tee /sys/class/drm/card1/gt_max_freq_mhz"

# 2. Maximum performance profile (Gives 100% power, runs hotter)
alias gpu-performance="echo 1050 | sudo tee /sys/class/drm/card1/gt_min_freq_mhz && echo 1050 | sudo tee /sys/class/drm/card1/gt_max_freq_mhz"

# 3. Default automatic profile (Returns control back to the Linux kernel)
alias gpu-auto="echo 350 | sudo tee /sys/class/drm/card1/gt_min_freq_mhz && echo 1050 | sudo tee /sys/class/drm/card1/gt_max_freq_mhz"


# Search for matching filenames in the current directory
foo() {
    ls -A | grep -i "$1"
}


export PATH="$PATH:/opt/liquibase"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/rxman/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
