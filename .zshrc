# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aj/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# alias tmux="TERM=screen-256color-bce tmux"
# Load Angular CLI autocompletion.
source <(ng completion script)


#Aliases
alias cdusr="cd /mnt/c/Users/aj.steinhuser/"
alias lockstart="node --openssl-legacy-provider --max_old_space_size=16384 ./node_modules/@angular/cli/bin/ng serve"
alias lockstart-local="node --openssl-legacy-provider --max_old_space_size=16384 ./node_modules/@angular/cli/bin/ng serve"
alias grep='grep --color=always'
alias emojigrep='grep -PIR "[\x{1f300}-\x{1f5ff}\x{1f900}-\x{1f9ff}\x{1f600}-\x{1f64f}\x{1f680}-\x{1f6ff}\x{2600}-\x{26ff}\x{2700}-\x{27bf}\x{1f1e6}-\x{1f1ff}\x{1f191}-\x{1f251}\x{1f004}\x{1f0cf}\x{1f170}-\x{1f171}\x{1f17e}-\x{1f17f}\x{1f18e}\x{3030}\x{2b50}\x{2b55}\x{2934}-\x{2935}\x{2b05}-\x{2b07}\x{2b1b}-\x{2b1c}\x{3297}\x{3299}\x{303d}\x{00a9}\x{00ae}\x{2122}\x{23f3}\x{24c2}\x{23e9}-\x{23ef}\x{25b6}\x{23f8}-\x{23fa}]"'

export PATH="$PATH:/opt/mssql-tools18/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"
export CHROME_BIN='/mnt/c/Program\ Files/Google/Chrome/chrome.exe'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aj/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aj/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/aj/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/aj/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# plugins+=(zsh-vi-mode)
set -o vi




if [ -f "$HOME/.local/share/dnvm/env" ]; then
    . "$HOME/.local/share/dnvm/env"
fi
