bind -x $'"\C-l":clear;'
export EDITOR='/usr/bin/nvim'
alias ls='lsd -la'
alias i3-edit='nvim ~/.config/i3/config'
alias i3status-edit='nvim .config/i3status-rust/config.toml'
alias picom-edit='nvim .config/picom.conf'
# alias tar='tar -xzvf'
alias shred='shred -vuf'
alias refresh='source ~/.bashrc'
alias bash-edit='nvim ~/.bashrc'
alias nvim-edit='nvim ~/.config/nvim/init.vim'
alias code-projects='cd ~/Data/CodeProjects/'
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
alias bluetooth-start='sudo systemctl enable --now bluetooth'
alias bluetooth-end='sudo systemctl disable --now bluetooth'
alias bluetooth-fix='sudo systemctl restart bluetooth'
alias bashrc-edit='nvim ~/.bashrc'
alias docker-start='sudo systemctl start --now docker'
alias docker-end='sudo systemctl disable --now docker'
alias check-governor='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias powersave='sudo x86_energy_perf_policy --turbo-enable 0 && sudo cpupower frequency-set -g powersave && sudo x86_energy_perf_policy 15 && check-governor'
alias maxperformance='sudo x86_energy_perf_policy --turbo-enable 1 && sudo cpupower frequency-set -g performance && sudo x86_energy_perf_policy 0 && check-governor'
alias update-all='paru && flatpak update && sudo snap refresh'
alias code='codium'
cd() { builtin cd "$@" && ls; }

#export FZF_DEFAULT_COMMAND="fd . $HOME"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_ALT_C_COMMAND="fd -t d . $HOME"


source /usr/share/nvm/init-nvm.sh
#source /usr/share/fzf/key-bindings.bash
#source /usr/share/fzf/completion.bash

# systemd-analyze
# echo -e "\e[3m\e[1mto the stars; through the thorns.\e[0m"
# echo -e "\e[3m\e[1msteel your resolve.\e[0m"
# echo -e "\e[3m\e[1mthe shining beacon in a brave new world.\e[0m"



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

#export LFS=/mnt/lfs
export LFS=$PROJECTAPOPHIS
export PROJECTAPOPHIS=/mnt/ProjectApophis
export MAKEFLAGS='-j8'
export CFLAGS="-march=native -O2 -mfpmath=sse -fomit-frame-pointer -pipe -mpopcnt"
export CXXFLAGS="$CFLAGS"
#export PATH="$HOME/.cargo/bin:$PATH"
export RUSTFLAGS="-C target-cpu=native"
export GTK_THEME="Adwaita:dark"
# For DaVinci Resolve
export RUSTICL_ENABLE="iris"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/nolaifu/.sdkman"
[[ -s "/home/nolaifu/.sdkman/bin/sdkman-init.sh" ]] && source "/home/nolaifu/.sdkman/bin/sdkman-init.sh"
