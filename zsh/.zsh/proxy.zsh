#!/bin/zsh

# clash mihomo
export PATH="/opt/clash/bin:$PATH"

# 默认静默开启代理
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
export all_proxy="socks5://127.0.0.1:7890"

export HTTP_PROXY="$http_proxy"
export HTTPS_PROXY="$https_proxy"
export ALL_PROXY="$all_proxy"

proxy() {
  export http_proxy="http://127.0.0.1:7890"
  export https_proxy="http://127.0.0.1:7890"
  export all_proxy="socks5://127.0.0.1:7890"

  export HTTP_PROXY="$http_proxy"
  export HTTPS_PROXY="$https_proxy"
  export ALL_PROXY="$all_proxy"

  echo "Set proxy successfully"
}

unproxy() {
  unset http_proxy https_proxy all_proxy
  unset HTTP_PROXY HTTPS_PROXY ALL_PROXY
  echo "Unset proxy successfully"
}

testproxy() {
  curl -vv https://www.google.com
}

testgithub() {
  curl -vv https://github.com
}

iptest() {
  curl cip.cc
}
