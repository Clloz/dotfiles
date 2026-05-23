#!/bin/zsh

# clash mihomo
export PATH="/opt/clash/bin:$PATH"

# proxy list
export all_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
export http_proxy="http://127.0.0.1:7890"
alias vproxy="export all_proxy=socks5://127.0.0.1:1090; echo \"Set proxy successful\" "
alias proxy="export https_proxy=http://127.0.0.1:7890;export http_proxy=http://127.0.0.1:7890;export all_proxy=socks5://127.0.0.1:7890;echo \"Set proxy successfully\" "
alias testproxy="curl -vv https://www.google.com"
alias testgithub="curl -vv https://github.com"
alias unproxy="unset http_proxy;unset https_proxy;unset all_proxy;echo \"Unset proxy successfully\" "
alias iptest="curl cip.cc"
