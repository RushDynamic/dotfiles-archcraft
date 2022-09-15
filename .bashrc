#
# ~/.bashrc
#

cdd() {
    cd "$1"
    ls
}

lock() {
    sudo chown root:root "$1"
    sudo chmod 700 "$1"
}

pconn() {
    #export PRUSER="$(sudo awk 'NR==1{print $1;}' "$HOME/Documents/proton_vpn_creds.txt")"
    #export PRPASS="$(sudo awk 'NR==2{print $1;}' "$HOME/Documents/proton_vpn_creds.txt")"
    config_number="$([ "$1" ] && echo "$1" || echo "02")"
    config="$HOME/Scripts/protonvpn-configs/nl-free-$config_number.protonvpn.net.udp.ovpn"
    sudo openvpn --config $config --auth-user-pass "$HOME/Documents/proton_vpn_creds.txt"
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
