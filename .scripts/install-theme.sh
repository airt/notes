#!/usr/bin/env bash

set -ex

version='v6.2.0'

if [ ! -d 'themes/next' ]
then
  git clone --branch $version --depth 1 https://github.com/theme-next/hexo-theme-next themes/next
  sed -i.b 's/^scheme/#&/g' themes/next/_config.yml
  echo 'scheme: Mist' >> themes/next/_config.yml
fi
