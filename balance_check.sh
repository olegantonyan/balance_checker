#!/usr/bin/zsh

source ~/.zshrc
cd $(dirname $(readlink -f $0))
bundle exec ./bin/balance_checker -c ./config/balance_checker.yml

