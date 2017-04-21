#!/usr/bin/env bash

if [ ! -d 'themes/next' ]
then
  git clone https://github.com/iissnan/hexo-theme-next themes/next
  cp themes/next-config.yml themes/next/_config.yml
fi
