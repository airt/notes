---
title: Notes of Building Hexo Blog
date: 2017-08-22
tags:
---

Notes of building <https://airt.github.io/notes/>

<!-- more -->

## Prerequisites

- [Node](https://nodejs.org/)
- [Git](https://git-scm.com/)
- [GitHub](https://github.com/)

## Initialize

> [Hexo documentation](https://hexo.io/docs/)

```bash
npm install hexo-cli -g
hexo init notes
```

## Configure

> [Hexo configuration](https://hexo.io/docs/configuration.html)

Modify url configuration in `_config.yml`:

```yml
# URL
url: https://yourname.github.io/notes
root: /notes/
```

## Install a Theme

> [NexT for Hexo](https://github.com/iissnan/hexo-theme-next)
> [NexT documentation](http://theme-next.iissnan.com/)

```bash
version='v5.1.2'
git clone --branch $version --depth 1 https://github.com/iissnan/hexo-theme-next themes/next
```

Set theme in hexo root configuration `_config.yml`:

```yml
theme: next
```

### More Themes

- [Hexo themes](https://hexo.io/themes/)
- [Vno](https://github.com/lenbo-ma/hexo-theme-vno)

## Install Plugins

- [Hexo plugins](https://hexo.io/plugins/)
- [Hexo generator feed](https://github.com/hexojs/hexo-generator-feed)
- [Hexo generator sitemap](https://github.com/hexojs/hexo-generator-sitemap)
- [Hexo generator search](https://github.com/PaicHyperionDev/hexo-generator-search)

## Setup GitHub Repository

### [Creat a New Repository](https://help.github.com/articles/creating-a-new-repository/)

New repository `https://github.com/yourname/notes`

### [Configure GitHub Pages](https://help.github.com/articles/configuring-a-publishing-source-for-github-pages/)

At `https://github.com/yourname/notes/settings` > `GitHub Pages` , choose `gh-pages branch`

## Setup Continuous Deployment

### [Enable Travis-CI for Repository](https://travis-ci.com/)

### [Configure Travis-CI Scripts](https://docs.travis-ci.com/user/customizing-the-build/)

Add script commands in `.travis.yml`:

```yml
script:
  - npm run build
```

where npm scripts:

```json
{
  "scripts": {
    "build": "hexo generate"
  }
}
```

### [Setup Travis-CI Deployment for GitHub Pages](https://docs.travis-ci.com/user/deployment/pages)

Add [environment variables](https://docs.travis-ci.com/user/environment-variables/) `GITHUB_TOKEN` in Travis-CI settings

And add deployment configuration in `.travis.yml`:

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

## Publish

```bash
git add .
git commit
git push
open https://yourname.github.io/notes
```

## Remarks

### Hexo Commands

> [Hexo commands](https://hexo.io/docs/commands.html)

Start a local server:

```bash
hexo server
open http://localhost:4000/
```

### Examples

Source of this site: <https://github.com/airt/notes>
