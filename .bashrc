### Added by Codeium. These lines cannot be automatically removed if modified
if command -v termium > /dev/null 2>&1; then
  eval "$(termium shell-hook show pre)"
fi
### End of Codeium integration

# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH=/home/nolaifu/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_OSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Uncomment the following line if you do not want OMB to overwrite the existing
# aliases by the default OMB aliases defined in lib/*.sh
# OMB_DEFAULT_ALIASES="check"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(

)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(

)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(

)

# Which plugins would you like to conditionally load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: 
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi

source "$OSH"/oh-my-bash.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"
bind -x $'"\C-l":clear;'
export EDITOR='/usr/bin/nvim'
alias lsf='ls -lah --color=auto --color=always | less -R'
alias ls='ls -la --color=auto --color=always'
alias i3-edit='nvim ~/.config/i3/config'
alias i3status-edit='nvim .config/i3status-rust/config.toml'
alias picom-edit='nvim .config/picom.conf'
# alias tar='tar -xzvf'
alias shred='shred -vuf'
alias refresh='source ~/.bashrc'
alias bash-edit='nvim ~/.bashrc'
alias nvim-edit='nvim ~/.config/nvim/init.vim'
alias code-projects='~/Data/CodeProjects/'
alias zerotier-start='sudo systemctl start zerotier-one --now'
alias zerotier-stop='sudo systemctl disable zerotier-one --now'
alias tp='trash-put'
alias tl='trash-list'
alias te='trash-empty'
alias gs='git status -uall'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gd='git diff'
alias gl='git log --graph --oneline --decorate'
alias nv='nvim'
alias rust-cross-compile='sudo systemctl start --now docker && cross build --target x86_64-unknown-linux-gnu --release && cross build --target x86_64-pc-windows-gnu --release && sudo systemctl stop --now docker'
alias bluetooth-start='sudo systemctl start --now bluetooth'
alias bluetooth-end='sudo systemctl disable --now bluetooth'
alias bashrc-edit='nvim ~/.bashrc'
alias docker-start='sudo systemctl start --now docker'
alias docker-end='sudo systemctl disable --now docker'
alias check-governor='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias powersave='sudo x86_energy_perf_policy --turbo-enable 0 && sudo cpupower frequency-set -g powersave && sudo x86_energy_perf_policy 15 && check-governor'
alias maxperformance='sudo x86_energy_perf_policy --turbo-enable 1 && sudo cpupower frequency-set -g performance && sudo x86_energy_perf_policy 0 && check-governor'
alias update-all='paru && flatpak update && sudo snap refresh'
alias veadotube='exec ./Downloads/veadotube\ mini/veadotube\ mini.x86_64 2>&1>/dev/null &exit'
cd() { builtin cd "$@" && ls; }

export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"


source /usr/share/nvm/init-nvm.sh
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# systemd-analyze
# echo -e "\e[3m\e[1mto the stars; through the thorns.\e[0m"
# echo -e "\e[3m\e[1msteel your resolve.\e[0m"
# echo -e "\e[3m\e[1mthe shining beacon in a brave new world.\e[0m"

### Added by Codeium. These lines cannot be automatically removed if modified
if command -v termium > /dev/null 2>&1; then
  eval "$(termium shell-hook show post)"
fi
### End of Codeium integration

shopt -s globstar

find() {
    if [ $# = 1 ]
    then
        command find . -iname "*$@*"
    else
        command find "$@"
    fi
}

glog() {
    setterm -linewrap off

    git --no-pager log --all --color=always --graph --abbrev-commit --decorate \
        --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' | \
        sed -E \
            -e 's/\|(\x1b\[[0-9;]*m)+\\(\x1b\[[0-9;]*m)+ /├\1─╮\2/' \
            -e 's/(\x1b\[[0-9;]+m)\|\x1b\[m\1\/\x1b\[m /\1├─╯\x1b\[m/' \
            -e 's/\|(\x1b\[[0-9;]*m)+\\(\x1b\[[0-9;]*m)+/├\1╮\2/' \
            -e 's/(\x1b\[[0-9;]+m)\|\x1b\[m\1\/\x1b\[m/\1├╯\x1b\[m/' \
            -e 's/╮(\x1b\[[0-9;]*m)+\\/╮\1╰╮/' \
            -e 's/╯(\x1b\[[0-9;]*m)+\//╯\1╭╯/' \
            -e 's/(\||\\)\x1b\[m   (\x1b\[[0-9;]*m)/╰╮\2/' \
            -e 's/(\x1b\[[0-9;]*m)\\/\1╮/g' \
            -e 's/(\x1b\[[0-9;]*m)\//\1╯/g' \
            -e 's/^\*|(\x1b\[m )\*/\1⎬/g' \
            -e 's/(\x1b\[[0-9;]*m)\|/\1│/g' \
        | command less -r +'/[^/]HEAD'

    setterm -linewrap on
}

lazygit() {
    git status .
    git add .
    git commit -m "$@"
    git push origin HEAD
}

export -f glog
export -f lazygit

export LFS=/mnt/lfs

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/nolaifu/.sdkman"
[[ -s "/home/nolaifu/.sdkman/bin/sdkman-init.sh" ]] && source "/home/nolaifu/.sdkman/bin/sdkman-init.sh"
