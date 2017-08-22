---
title: Records of Building Hexo Blog
date: 2017-08-22
tags:
---

## Prerequisites

- [Node](https://nodejs.org/)
- [Git](https://git-scm.com/)
- [GitHub](https://github.com/)

## Initialize

> [Hexo Documentation](https://hexo.io/docs/)

```bash
npm install hexo-cli -g
hexo init <folder>
cd <folder>
npm install
```

## Configuration

See [Hexo Configuration](https://hexo.io/docs/configuration.html)

## Install a Theme

> [NexT for Hexo](https://github.com/iissnan/hexo-theme-next)

```bash
version='v5.1.2'
git clone --branch $version --depth 1 https://github.com/iissnan/hexo-theme-next themes/next
```

Set theme in hexo root config (`_config.yml`):

```yml
theme: next
```

## Setup GitHub Pages

1. [Creating a new repository](https://help.github.com/articles/creating-a-new-repository/)

1. [Configure GitHub pages](https://help.github.com/articles/configuring-a-publishing-source-for-github-pages/)

## Setup Continuous Deployment

1. [Enable Travis-CI for this repository](https://docs.travis-ci.com/)

1. [Setup Travis-CI deployment for GitHub pages](https://docs.travis-ci.com/user/deployment/pages)

Sample deployment configuration (`.travis.yml`):

```yml
deploy:
  provider: pages
  skip_cleanup: true
  github_token: $GITHUB_TOKEN
  target_branch: gh-pages
  local_dir: public
  on:
    branch: master
```

## Hexo Commands

> [Hexo Commands](https://hexo.io/docs/commands.html)

Starts a local server:

```bash
hexo server
open http://localhost:4000/
```

<!-- ## Remarks -->
