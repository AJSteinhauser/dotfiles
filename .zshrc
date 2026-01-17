# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Lines configured by zsh-newuser-install
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aj/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


#Aliases
alias cdusr="cd /mnt/c/Users/aj.steinhuser/"
alias lockstart="node --openssl-legacy-provider --max_old_space_size=16384 ./node_modules/@angular/cli/bin/ng serve"
alias lockstart-local="node --openssl-legacy-provider --max_old_space_size=16384 ./node_modules/@angular/cli/bin/ng serve"
alias grep='grep --color=always'
alias python='python3'
alias pip='pip3'
alias emojigrep='grep -PIR "[\x{1f300}-\x{1f5ff}\x{1f900}-\x{1f9ff}\x{1f600}-\x{1f64f}\x{1f680}-\x{1f6ff}\x{2600}-\x{26ff}\x{2700}-\x{27bf}\x{1f1e6}-\x{1f1ff}\x{1f191}-\x{1f251}\x{1f004}\x{1f0cf}\x{1f170}-\x{1f171}\x{1f17e}-\x{1f17f}\x{1f18e}\x{3030}\x{2b50}\x{2b55}\x{2934}-\x{2935}\x{2b05}-\x{2b07}\x{2b1b}-\x{2b1c}\x{3297}\x{3299}\x{303d}\x{00a9}\x{00ae}\x{2122}\x{23f3}\x{24c2}\x{23e9}-\x{23ef}\x{25b6}\x{23f8}-\x{23fa}]"'

export PATH="/Applications/Windsurf.app/Contents/MacOS:$PATH"
export PATH="$PATH:/opt/mssql-tools18/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"
export CHROME_BIN='/mnt/c/Program\ Files/Google/Chrome/chrome.exe'

set -o vi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ajsteinhauser/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ajsteinhauser/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ajsteinhauser/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ajsteinhauser/google-cloud-sdk/completion.zsh.inc'; fi
