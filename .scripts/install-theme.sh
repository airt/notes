#!/usr/bin/env bash

set -e
set -x

version='v5.1.2'

if [ ! -d 'themes/next' ]
then
  git clone --branch $version --depth 1 https://github.com/iissnan/hexo-theme-next themes/next
  cp themes/next-config.yml themes/next/_config.yml
fi
